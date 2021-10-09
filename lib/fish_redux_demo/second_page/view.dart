import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SecondState state, Dispatch dispatch, ViewService viewService) {
  return WillPopScope(
      child: _bodyWidget(state, dispatch),
      onWillPop: () async{
        dispatch(SecondActionCreator.onBackFirst());
        return false;
      });
}

Widget _bodyWidget(SecondState state, Dispatch dispatch) {
  return Scaffold(
    appBar: AppBar(
      title: Text('SecondPage'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("下方数据是FirstPage传递过来的："), Text(state.msg)],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        // 跳转第二个页面
      },
      child: Icon(Icons.arrow_forward),
    ),
  );
}
