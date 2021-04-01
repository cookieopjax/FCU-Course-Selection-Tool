import 'package:flutter/material.dart';
import 'package:fcu_course_selection_tool/dataProcess/load_data.dart';

class ClassTable extends StatelessWidget {
  var data = LoadData();
  ClassTable({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
