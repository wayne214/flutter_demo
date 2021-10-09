import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/fish_redux_demo/list_page/bean/item_data_entity.dart';

class ItemState implements Cloneable<ItemState> {

  Datas itemDetail;

  @override
  ItemState clone() {
    return ItemState()
      ..itemDetail = itemDetail
    ;
  }
}

ItemState initState(Map<String, dynamic> args) {
  return ItemState();
}
