import 'package:fcu_course_selection_tool/screans/course_table.dart';
import 'package:flutter/material.dart';
import 'package:fcu_course_selection_tool/dataProcess/load_data.dart';

class CourseSearch extends StatefulWidget {
  @override
  _CourseSearchState createState() => _CourseSearchState();
}

class _CourseSearchState extends State<CourseSearch> {
  var data = LoadData();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Switch(
                value: data.codeEnable,
                onChanged: (value) {
                  setState(() {
                    data.codeEnable = !data.codeEnable;
                  });
                  //print(data.courseEnable.toString());
                }),
            Flexible(
                child: TextField(
              decoration: InputDecoration(hintText: "輸入選課代號"),
              onChanged: (value) {
                data.codeValue = value;
                // print(data.courseValue);
              },
            ))
          ],
        ),
        ElevatedButton(
          child: const Text('送出資料'),
          onPressed: () {
            print(data.codeEnable.toString());
            print(data.codeValue);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClassTable(data: data)),
            );
          },
        ),
      ],
    );
  }
}
