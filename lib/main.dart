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
      home: TestData(),
    );
  }
}

class TestData extends StatelessWidget {
  var data = LoadData();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: data.getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              return Text("Contents: ${snapshot.data}");
            }
          } else {
            // 请求未结束，显示loading
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}



