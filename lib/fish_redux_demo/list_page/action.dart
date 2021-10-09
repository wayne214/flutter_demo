import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ListAction { action, updateItem, toNotify }

class ListActionCreator {
  static Action updateItem() {
    return Action(ListAction.updateItem);
  }

  /// 广播通知
  static Action toNotify(String msg) {
    return Action(ListAction.toNotify, payload: msg);
  }

}
