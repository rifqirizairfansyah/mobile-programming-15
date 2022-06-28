import 'package:flutter/material.dart';
import 'package:pertemuan15/screens/profile/widgets/login.dart';
import 'package:pertemuan15/shared_pref_screen.dart';
import 'package:flutter/services.dart';
import 'package:pertemuan15/screens/profile/widgets/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      home: Login(),
    );
  }
}
