import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(FirstPageState state, Dispatch dispatch, ViewService viewService) {
  return _bodyWidget(state, dispatch);
}

Widget _bodyWidget(FirstPageState state, Dispatch dispatch){
  return Scaffold(
    appBar: AppBar(
      title: Text('FirstPage'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("下方数据是Secondpage传递过来的："),
          Text(state.msg)
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        // 跳转第二个页面
      },
      child: Icon(Icons.arrow_forward),
    ),
  );
}
