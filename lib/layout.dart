import 'package:flutter/material.dart';
import 'FavoriteWidget.dart';

class LayoutPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var args = ModalRoute.of(context).settings.arguments;
    
    
    
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: new Text(
                      'Oeschinen Lake Campground',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Text(
                    'Kandersteg, Switzerland',
                    style: new TextStyle(
                      color: Colors.grey[500]
                    ),
                  )
                ],
              )
          ),
//          new Icon(
//            Icons.star,
//            color: Colors.red[500],
//          ),
//          new Text('41')
          new FavoriteWidget(),
        ],
      )
    );

    Color color = Theme.of(context).primaryColor;
    // 三个按钮
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 平均分配每一列占据的行空间
        children: <Widget>[
          _bulidButtonColumn(color, Icons.call, 'CALL'),
          _bulidButtonColumn(color, Icons.near_me, 'ROUTE'),
          _bulidButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return  Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
//            Image.network('https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg'),
            titleSection,
            buttonSection,
            textSection,
            Container(
              child: Text('路由获取参数：\n' + args),
            )
          ],
        ),
      );
  }
  // 构建统一按钮样式的方法
  Column _bulidButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
      //    如果要添加填充，边距，边框或背景色，请使用Container来设置（译者语：只有容器有这些属性）
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color
            ),
          ),
        )
      ],
    );
  }

}