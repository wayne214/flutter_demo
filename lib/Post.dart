import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

Future<Post> fetchPost() async{
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final responseJson = json.decode(response.body);
  return new Post.fromJson(responseJson);
}

Future<Post> getHttp() async {
  Response response;
  try{
    response = await Dio().get('https://jsonplaceholder.typicode.com/posts/1');
    print(response);
//    final responseJson = json.decode(response.body);
    return new Post.fromJson(response.data);
  }catch(e) {
    print(e);
  }
  return new Post.fromJson({'hh': 1});
}

class Post{
  final int userId;
  final int id;
  final String title;
  final String body;
  Post({this.userId,this.id, this.title, this.body});
  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}