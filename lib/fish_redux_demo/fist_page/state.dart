import 'package:fish_redux/fish_redux.dart';

class FirstPageState implements Cloneable<FirstPageState> {

  ///传递给下个页面的值
  static const String fixedMsg = "\n我是FirstPage页面传递过来的数据：FirstValue";

  String msg;

  @override
  FirstPageState clone() {
    return FirstPageState()..msg = msg;
  }
}

FirstPageState initState(Map<String, dynamic> args) {
  return FirstPageState()..msg = "\n暂无";
}
