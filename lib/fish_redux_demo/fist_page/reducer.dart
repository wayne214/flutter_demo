import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FirstPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<FirstPageState>>{
      FirstPageAction.action: _onAction,
    },
  );
}

FirstPageState _onAction(FirstPageState state, Action action) {
  final FirstPageState newState = state.clone();
  return newState;
}
