import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/fish_redux_demo/fist_page/page.dart';
import 'package:flutter_app/fish_redux_demo/list_page/page.dart';
import 'package:flutter_app/fish_redux_demo/second_page/page.dart';
import 'layout.dart';
import 'BottomNavigationBarDemo.dart';
import 'bottom_app_bar.dart';
import 'Post.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/shop_provider/models/cart.dart';
import 'package:flutter_app/shop_provider/models/catalog.dart';
import 'package:flutter_app/shop_provider/screens/cart.dart';
import 'package:flutter_app/shop_provider/screens/catalog.dart';
import 'package:flutter_app/shop_provider/screens/login.dart';

void main() => runApp(createApp());

Widget createApp(){
  final AbstractRoutes routes = PageRoutes(pages: {
    'first_page': FirstPagePage(),
    'second_page': SecondPage(),
    'list_page': ListPage(),
  });

  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  return MaterialApp(
    title: 'fish_redux',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage("list_page", null),
    onGenerateRoute: (RouteSettings settings){
      return MaterialPageRoute<Object>(builder: (BuildContext context){
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider(create: (context)=> CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context)=> CartModel(),
          update: (context, catalog, cart){
            cart.catalog = catalog;
            return cart;
          },
        )
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => MyLogin(),
          '/catalog': (context)=> MyCatalog(),
          '/cart': (context)=> MyCart()
        },
      ),
    );


//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
//        // counter didn't reset back to zero; the application is not restarted.
//        primarySwatch: Colors.blue,
//      ),
////      home: MyHomePage(title: 'Flutter Demo Home Page'),
//      home: new BottomAppBarDemo(),
////       home: new Center(
////         child: new FutureBuilder<Post>(
////           future: getHttp(),
////             builder: (context, snapshot) {
////               if(snapshot.hasData) {
////                 return new Text(snapshot.data.title);
////               }else if(snapshot.hasError) {
////                 return new Text("${snapshot.error}");
////               }
////               return new CircularProgressIndicator();
////             }
////         ),
////       ),
//      // 路由表
//      routes: <String, WidgetBuilder>{
//        'layout': (BuildContext context) => new LayoutPage()
//      },
//    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  // 在Dart语言中使用下划线前缀标识符，会强制其变成私有的。
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  ScrollController _scrollController = new ScrollController();

  bool isLoadMore = false;

  @override
  void initState() {
    super.initState();
//    print(_suggestions.length);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _suggestions.clear();
        _suggestions.addAll(generateWordPairs().take(10));
      });
    });
  }

  Future<Null> _loadMore() async {
    if (!isLoadMore) {
      setState(()=> isLoadMore = true);
      await Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _suggestions.addAll(generateWordPairs().take(10));
          isLoadMore = false;
        });
      });
    }

  }

  Widget _buildLoadingIndicator() {
    return new Padding(padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoadMore ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return Container(
      child: RefreshIndicator(
        child: ListView.builder(
            itemCount: _suggestions.length + 1,
            padding: const EdgeInsets.all(16.0),
            // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
            // 在偶数行，该函数会为单词对添加一个ListTile row.
            // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
            // 注意，在小屏幕上，分割线看起来可能比较吃力。
            itemBuilder: (context, i) {
              // 在每一列之前，添加一个1像素高的分隔线widget
              if (i.isOdd) return new Divider();
              // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
              // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
              // 如果是建议列表中最后一个单词对
//              print(_suggestions.length);
              if (i ==  _suggestions.length){
                return _buildLoadingIndicator();
              } else {
                return _buildRow(_suggestions[i]);
              }
            },
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            ),
        onRefresh: _onRefresh,
      ),
    );
  }

  Widget _buildRow(WordPair pair) {
//    添加 alreadySaved来检查确保单词对还没有添加到收藏夹中。
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      /**
       * 提示: 在Flutter的响应式风格的框架中，调用setState() 会为State对象触发build()方法，从而导致对UI的更新
       * */
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    /**
     * 提示: 某些widget属性需要单个widget（child），而其它一些属性，如action，需要一组widgets(children），用方括号[]表示
     * Scaffold 是 Material library 中提供的一个widget, 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。widget树可以很复杂
     * */

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    // 导航方式一
    Navigator.pushNamed(context, 'layout', arguments: '这是main页面');
    // 导航方式二
//  Navigator.push(context, new MaterialPageRoute(builder: (context) {
//    return LayoutPage();
//  }));
    // 导航方式三
//    添加Navigator.push调用，这会使路由入栈（以后路由入栈均指推入到导航管理器的栈）
//    Navigator.of(context).push(
//      new MaterialPageRoute(
//          builder: (context) {
//            final tiles = _saved.map(
//                (pair) {
//                  return new ListTile(
//                    title: new Text(
//                      pair.asPascalCase,
//                      style: _biggerFont,
//                    ),
//                  );
//                }
//            );
//            // ListTile的divideTiles()方法在每个ListTile之间添加1像素的分割线。 该 divided 变量持有最终的列表项。
//            final divided = ListTile
//            .divideTiles(
//              context: context,
//              tiles: tiles,
//            ).toList();
//
////            return LayoutPage();
//            return new Scaffold(
//              appBar: AppBar(
//                title: Text("Saved Suggestions"),
//              ),
//              body: ListView(children: divided,),
//            );
//          }
//      ),
//    );
  }
}
