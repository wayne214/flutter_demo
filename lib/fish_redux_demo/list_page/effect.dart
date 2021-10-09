import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/fish_redux_demo/list_page/item/state.dart';

import 'action.dart';
import 'bean/item_data_entity.dart';
import 'state.dart';

Effect<ListState> buildEffect() {
  return combineEffects(<Object, Effect<ListState>>{
    Lifecycle.initState: _init,
    ListAction.toNotify: _toNotify,
  });
}

///发送广播
void _toNotify(Action action, Context<ListState> ctx){
  ///广播通信
  ctx.broadcast(ListActionCreator.toNotify("广播内容"));
}

void _receiveNotify(Action action, Context<ListState> ctx) async {
  ///接受广播
  print("跳转一页面:${action.payload}");
}


void _init(Action action, Context<ListState> ctx) async{
  String apiUrl = "https://www.wanandroid.com/project/list/1/json";
  Response response = await Dio().get(apiUrl);

  ItemDetailBean itemDetailBean =
  ItemDetailBean.fromJson(json.decode(response.toString()));


  List<Datas> listData = itemDetailBean.data.datas;

  if(listData.isNotEmpty){
    ItemState itemState;
    listData.forEach((element) {
      if(element != null){
        itemState = new ItemState();
        ctx.state.items.add(itemState..itemDetail = element);
      }
    });
  }

  ctx.dispatch(ListActionCreator.updateItem());

}
