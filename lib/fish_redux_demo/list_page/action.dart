import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ListAction { action, updateItem }

class ListActionCreator {
  static Action updateItem() {
    return Action(ListAction.updateItem);
  }
}
