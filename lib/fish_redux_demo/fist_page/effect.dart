import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<FirstPageState> buildEffect() {
  return combineEffects(<Object, Effect<FirstPageState>>{
    FirstPageAction.toSecond: _toSecond,
  });
}

void _toSecond(Action action, Context<FirstPageState> ctx) async{
  var result = await Navigator.of(ctx.context).pushNamed("second_page", arguments: {"firstValue": FirstPageState.fixedMsg});

  ctx.dispatch(FirstPageActionCreator.updateMsg((result as Map)['secondValue']));

}
