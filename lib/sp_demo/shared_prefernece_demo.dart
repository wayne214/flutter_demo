import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDemo extends StatelessWidget {
  const SharedPreferenceDemo({Key key}) : super(key: key);

  // 存储数据
  _savaData() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("key_string", "hello");
  }

  // 读取数据
  Future<String> _readData() async{
    var prefs = await SharedPreferences.getInstance();
    var result = prefs.getString("key_string");
    return result ?? "暂无数据";
  }

  // 删除指定数据
  Future<String> _deleteData() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("key_string");
  }

  // 清空数据
  Future<String> _clearData() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  /// key相关操作
  // 获取所有key
  Future<Set<String>> _getKeys() async{
    var prefs = await SharedPreferences.getInstance();
    var keys = prefs.getKeys();
    return keys ?? [];
  }

  // 检测key是否存在
  Future<bool> _containsKeys() async{
    var prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("key_string") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
