import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: new RandomWords(),
      // 路由表
      routes: <String,WidgetBuilder> {
        'layout': (BuildContext context) => new LayoutPage()
      },
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  // 在Dart语言中使用下划线前缀标识符，会强制其变成私有的。
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions(){
    return new ListView.builder(
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
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
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
