import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FirstPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<FirstPageState>>{
      FirstPageAction.updateMsg: _onUpdateMsg,
    },
  );
}

FirstPageState _onUpdateMsg(FirstPageState state, Action action) {
  final FirstPageState newState = state.clone();
  newState.msg = action.payload;
  return newState;
}
