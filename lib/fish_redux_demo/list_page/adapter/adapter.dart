import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/fish_redux_demo/list_page/item/component.dart';
import 'package:flutter_app/fish_redux_demo/list_page/state.dart';

class ListItemAdapter extends SourceFlowAdapter<ListState> {
  static const String item_style = "item_style";

  ListItemAdapter()
      : super(
          pool: <String, Component<Object>>{
            item_style: ItemComponent()
          },
          );
}
