import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ListState> buildReducer() {
  return asReducer(
    <Object, Reducer<ListState>>{
      ListAction.updateItem: _onAction,
    },
  );
}

ListState _onAction(ListState state, Action action) {
  final ListState newState = state.clone();
  newState.items = state.items;
  return newState;
}
