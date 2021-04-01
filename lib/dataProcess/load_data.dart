import 'dart:convert';
import 'package:http/http.dart' as http;

class LoadData {
  int year, //學年度 : 110、109、108
      sms, //學期 : 1(上學期)、2(下學期)、3(暑修上)、4(暑修下)
      specificSubjectValue; //1(通識)、2(體育)、3(國文)

  bool codeEnable, //是否指定選課代號
      weekPeriodEnable, //是否指定週節
      courseEnable, //是否指定科目名稱
      teacherEnable, //使否指定開課教師姓名
      useEnglishEnable, //這是啥鬼
      useLanguageEnable, //是否指定授課語言
      specificSubjectEnable, //是否指定特定課程
      courseDescriptionEnable; //使否指定課程描述

  String lang, //資料的語言，包含"cht"及"en"
      codeValue, //選課代號
      courseValue, //科目名稱
      teacherValue, //開課教師
      useLanguageValue, //授課語言
      courseDescriptionValue, //課程描述
      week, //週 : 1、2....、7
      period; //節 : "*"代表全部，0、1、2、....、7

  LoadData({
    this.lang = "cht",
    this.week = "*",
    this.period = "*",
    this.year = 109,
    this.sms = 2,
    this.codeEnable = false,
    this.weekPeriodEnable = false,
    this.courseEnable = false,
    this.teacherEnable = false,
    this.useEnglishEnable = false,
    this.useLanguageEnable = false,
    this.specificSubjectEnable = false,
    this.courseDescriptionEnable = false,
    this.codeValue = "",
    this.courseValue = "",
    this.teacherValue = "",
    this.useLanguageValue = "01", //temp
    this.specificSubjectValue = 1, //temp
    this.courseDescriptionValue = "",
  });

  Future<String> getData() async {
    final url = Uri.parse(
        'https://coursesearch02.fcu.edu.tw/Service/Search.asmx/GetType2Result');
    final payload = {
      "baseOptions": {"lang": lang, "year": year, "sms": sms},
      "typeOptions": {
        "code": {"enabled": codeEnable, "value": codeValue},
        "weekPeriod": {
          "enabled": weekPeriodEnable,
          "week": week,
          "period": period
        },
        "course": {"enabled": courseEnable, "value": courseValue},
        "teacher": {"enabled": teacherEnable, "value": teacherValue},
        "useEnglish": {"enabled": useEnglishEnable},
        "useLanguage": {
          "enabled": useLanguageEnable,
          "value": useLanguageValue
        },
        "specificSubject": {
          "enabled": specificSubjectEnable,
          "value": specificSubjectValue
        },
        "courseDescription": {"enabled": courseEnable, "value": courseValue}
      }
    };
    final header = {"Content-Type": "application/json"};
    final body = json.encode(payload);
    final response = await http.post(url, headers: header, body: body);
    final data = json.decode(json.decode(response.body)['d'] as String);
    return data['items'].toString();
  }
}
