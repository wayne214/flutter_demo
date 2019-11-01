import 'package:flutter/material.dart';
import 'home.dart';
import 'page_business.dart';
import 'page_school.dart';
class BottomNavigationBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _selectedIndex = 0;
  List<Widget> _bottomNavPages = List();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomNavPages..add(PageHome('首页'))..add(PageBusiness('商城'))..add(PageSchool());
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _bottomNavPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页'), backgroundColor: Colors.red),
        BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('商城'), backgroundColor: Colors.blueGrey),
        BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('课程'), backgroundColor: Colors.orange)
      ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
  
}