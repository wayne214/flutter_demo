import 'package:flutter/material.dart';
class FavoriteWidget extends StatefulWidget{
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();

}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if(_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      }else{
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(icon: _isFavorited
              ? new Icon(Icons.star)
              : new Icon(Icons.star_border),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
          ),
        ),
        new SizedBox(
          child: Container(
            child: new Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

}