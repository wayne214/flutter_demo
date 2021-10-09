import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FirstPagePage extends Page<FirstPageState, Map<String, dynamic>> {
  FirstPagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FirstPageState>(
                adapter: null,
                slots: <String, Dependent<FirstPageState>>{
                }),
            middleware: <Middleware<FirstPageState>>[
            ],);

}
