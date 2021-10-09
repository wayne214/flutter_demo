import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/fish_redux_demo/list_page/adapter/adapter.dart';
import 'package:flutter_app/fish_redux_demo/list_page/item/state.dart';

class ListState extends MutableSource implements Cloneable<ListState> {

  List<ItemState> items;

  @override
  ListState clone() {
    return ListState();
  }

  @override
  Object getItemData(int index) {
    return items[index];
  }

  @override
  String getItemType(int index) {
    return ListItemAdapter.item_style;
  }

  @override
  int get itemCount => items.length;

  @override
  void setItemData(int index, Object data) {
    items[index] = data;
  }
}

ListState initState(Map<String, dynamic> args) {
  return ListState()
    ..items = new List();
}
