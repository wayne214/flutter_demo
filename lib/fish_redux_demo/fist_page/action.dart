import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FirstPageAction { toSecond, updateMsg }

class FirstPageActionCreator {
  static Action toSecond() {
    return Action(FirstPageAction.toSecond);
  }

  static Action updateMsg(String msg) {
    return Action(FirstPageAction.updateMsg, payload: msg);
  }
}
