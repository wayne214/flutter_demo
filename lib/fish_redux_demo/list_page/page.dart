import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/fish_redux_demo/list_page/adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ListPage extends Page<ListState, Map<String, dynamic>> {
  ListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ListState>(
                adapter: NoneConn<ListState>() + ListItemAdapter(),
                slots: <String, Dependent<ListState>>{
                }),
            middleware: <Middleware<ListState>>[
            ],);

}
