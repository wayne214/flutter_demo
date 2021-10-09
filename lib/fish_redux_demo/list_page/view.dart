import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(ListState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("ListPage"),
    ),
    body: _itemWidget(state, viewService),
  );
}

_itemWidget(ListState state, ViewService viewService) {
  var adapter = viewService.buildAdapter();
  if(state.items != null){
    return ListView.builder(itemBuilder: adapter.itemBuilder, itemCount: adapter.itemCount,);
  }else{
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
