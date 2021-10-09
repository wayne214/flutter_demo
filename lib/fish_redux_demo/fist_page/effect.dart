import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<FirstPageState> buildEffect() {
  return combineEffects(<Object, Effect<FirstPageState>>{
    FirstPageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<FirstPageState> ctx) {
}
