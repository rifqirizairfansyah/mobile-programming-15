import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pertemuan15/main.dart';
import 'package:pertemuan15/screens/profile/widgets/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final unameController = TextEditingController();
  final passController = TextEditingController();
  late final _timer = "";
  final bool _rememberMe = false;

  void loginToSystem(BuildContext context) async {
    if ((unameController == "") || (passController == "")) {
      Fluttertoast.showToast(
          msg: "Username dan password tidak boleh kosong",
          gravity: ToastGravity.CENTER,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red[800],
          textColor: Colors.white);
      return;
    }

    // showLoaderDialog(context, 30);
    final response = await http.post(
        Uri.parse("http://rismayana.diary-project.com/login.php"),
        body: jsonEncode({
          "username": unameController.text,
          "password": passController.text
        }));
    int statCode = response.statusCode;
    if (statCode == 200) {
      Navigator.pop(context);
      bool _isLogin = true;
      if (_rememberMe) saveDataLogin(_isLogin, unameController.text);
      String dataLogin = response.body;
      final data = jsonDecode(dataLogin);
      String resStatus = data["username"];
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Login Berhasil"),
              content: Text("Selamat datang $resStatus"),
// backgroundColor: Colors.red[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              actions: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100,
                    child: TextButton(
                      child: const Text("OK"),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.green[400],
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                    ),
                  ),
                ),
              ],
            );
          });
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Login gagal"),
              content: const Text(
                  "Username atau Password salah.\r\nSilahkan coba lagi!"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              actions: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100,
                    child: TextButton(
                      child: const Text("OK"),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.red[400],
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                    ),
                  ),
                ),
              ],
            );
          });
    }
  }

  showLoaderDialog(BuildContext context, int _period) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
  }

  void saveDataLogin(bool _isLogin, String dataLogin) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isLogin', _isLogin);
    pref.setString("username", dataLogin);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFF8A2387),
                Color(0xFFE94057),
                Color(0xFFF27121)
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                height: 480,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Hello',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please Login Your Account',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                          controller: unameController,
                          decoration: InputDecoration(
                              labelText: 'Email Address',
                              suffixIcon: Icon(
                                FontAwesomeIcons.envelope,
                                size: 17,
                              ))),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                          obscureText: true,
                          controller: passController,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: Icon(
                                FontAwesomeIcons.eyeSlash,
                                size: 17,
                              ))),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forget Password',
                              style: TextStyle(color: Colors.orangeAccent[700]),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        loginToSystem(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF8A2387),
                                  Color(0xFFE94057),
                                  Color(0xFFF27121)
                                ])),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Or Login using social media',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.orangeAccent[700],
                        ),
                        Icon(
                          FontAwesomeIcons.twitch,
                          color: Colors.orangeAccent[700],
                        ),
                        Icon(
                          FontAwesomeIcons.solidEnvelope,
                          color: Colors.orangeAccent[700],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
