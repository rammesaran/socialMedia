import 'package:http/http.dart' as http;
import 'package:socialmedia/model/postmodel.dart';
import 'dart:convert';

import 'package:socialmedia/model/usermodel.dart';

class ApiServie {
  Future getUserInfo(String name) async {
    final url = Uri.https("gorest.co.in", "public/v2/users");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
        List<User> userdetails =[];
      for (int i = 0; i < responseBody.length;i++) {
        User user = User.fromJson(responseBody[i]);
        if (user.name == name) {
       userdetails.add(user);
        }
      
      }
      return userdetails;

    } else {
      throw Exception("Something went wrong");
    }
  }

  Future getPostInfo() async {
    final url = Uri.https("gorest.co.in", "public/v2/posts");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> postData = [];
      for (int i = 0; i < responseBody.length; i++) {
        Post postDataResponse = Post.fromJson(responseBody[i]);
        postData.add(postDataResponse);
      }
      return postData;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
