import 'package:flutter/material.dart';

class PageSchool extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PageSchoolState();
}

class _PageSchoolState extends State<PageSchool> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('学校'),
      ),
      body: Center(
        child: Text('学校'),
      ),
    );
  }

}