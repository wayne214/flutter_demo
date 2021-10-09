import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action; ///隐藏系统包中的Action类

import 'action.dart';
import 'state.dart';

Effect<SecondState> buildEffect() {
  return combineEffects(<Object, Effect<SecondState>>{
    SecondAction.backFirst: _onBackFirst,
  });
}

void _onBackFirst(Action action, Context<SecondState> ctx) {
  ///pop当前页面，并且返回相应的数据
  Navigator.pop(ctx.context, {"secondValue": SecondState.fixedMsg});
}
