import 'dart:convert';
import 'dart:developer';

import 'package:pertemuan15/model/profile.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>> getPosts() async {
    List<Post>? postList = [];
    var client = http.Client();

    var uri = Uri.parse(
        "http://rismayana.diary-project.com/bio.php?prodi=Broadcasting");

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var dataDecode = jsonDecode(response.body);
      for (var prod in dataDecode) {
        postList.add(Post.fromJson(prod));
      }
      return postList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
