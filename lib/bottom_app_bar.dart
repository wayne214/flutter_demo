import 'package:flutter/material.dart';
import 'home.dart';
import 'page_business.dart';
import 'page_school.dart';

class BottomAppBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomAppBarDemoState();

}

class BottomAppBarDemoState extends State<BottomAppBarDemo> {
  int _selectedIndex = 0;
  List<Widget> _bottomNavPages = List();

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomNavPages..add(PageHome('首页'))..add(PageBusiness('商城'))..add(
        PageSchool())..add(PageBusiness('搜索'));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _bottomNavPages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.business,
                color: Colors.white,
              ),
              onPressed: () => _onItemTapped(1),
            ),
            SizedBox(), // 增加一些间隔
            IconButton(
              icon: Icon(
                Icons.school,
                color: Colors.white,
              ),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () => _onItemTapped(3),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      // 设置FloatingActionButton的位置在底部导航中间
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}