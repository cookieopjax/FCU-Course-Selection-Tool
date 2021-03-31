import 'package:flutter/material.dart';
import 'loadData.dart';

void main() {
  runApp(MyApp());
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
            title: Text('逢甲檢索系統'),
          ),
          body: TestData(),
        ));
  }
}

class TestData extends StatelessWidget {
  final data = LoadData(); //建立資料物件
  @override
  Widget build(BuildContext context) {
    data.week = 3;
    return Center(
      child: FutureBuilder<String>(
        future: data.getData(), //依據物件的成員變數取資料
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Text("資料 : ${snapshot.data}");
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
