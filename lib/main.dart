import 'package:fcu_course_selection_tool/screans/course_search_page.dart';
import 'package:fcu_course_selection_tool/screans/course_class.dart';
import 'package:fcu_course_selection_tool/screans/account_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent); //把通知欄顏色與appBar統一
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '逢甲課程檢索',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('逢甲課程檢索系統'),
        ),
        body: const BottomNavigationController(),
      ),
      debugShowCheckedModeBanner: false, //去除debug符號
    );
  }
}

class BottomNavigationController extends StatefulWidget {
  const BottomNavigationController({Key key}) : super(key: key);

  @override
  _BottomNavigationControllerState createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值
  final pages = [MyClass(), CourseSearch(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '我的課表',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '課程檢索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '個人資料',
          ),
        ],
        currentIndex: _currentIndex, //目前選擇頁索引值
        fixedColor: Colors.blue, //選擇頁顏色
        onTap: _onItemClick, //BottomNavigationBar 按下處理事件
      ),
    );
  }

  //BottomNavigationBar 按下處理事件，更新設定當下索引值
  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
