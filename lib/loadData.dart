import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadData{
  String lang, week, period;
  int year, sms;
  bool codeEnable, weekPeriodEnable, courseEnable, teacherEnable,
      useEnglishEnable, useLanguageEnable, specificSubjectEnable, courseDescriptionEnable;
  String codeValue, courseValue, teacherValue, useLanguageValue, specificSubjectValue, courseDescriptionValue;

  LoadData({
    this.lang = "cht",
    this.week = "1", //temp
    this.period = "3", //temp
    this.year = 109,
    this.sms = 2,
    this.codeEnable = false,
    this.weekPeriodEnable = false,
    this.courseEnable = false,
    this.teacherEnable = false,
    this.useEnglishEnable = false,
    this.useLanguageEnable = true, //temp
    this.specificSubjectEnable = true, //temp
    this.courseDescriptionEnable = false,
    this.codeValue = "",
    this.courseValue = "",
    this.teacherValue = "",
    this.useLanguageValue = "01", //temp
    this.specificSubjectValue = "1", //temp
    this.courseDescriptionValue = "",
  });

  Future<String> getData() async {
    var url = Uri.parse(
      'https://coursesearch02.fcu.edu.tw/Service/Search.asmx/GetType2Result');
    var payload = {
      "baseOptions": {"lang": lang, "year": year, "sms": sms},
      "typeOptions": {
        "code": {"enabled": codeEnable, "value": codeValue},
        "weekPeriod": {"enabled": weekPeriodEnable, "week": week, "period": period},
        "course": {"enabled": courseEnable, "value": courseValue},
        "teacher": {"enabled": teacherEnable, "value": teacherValue},
        "useEnglish": {"enabled": useEnglishEnable},
        "useLanguage": {"enabled": useLanguageEnable, "value": useLanguageValue},
        "specificSubject": {"enabled": specificSubjectEnable, "value": specificSubjectValue},
        "courseDescription": {"enabled": courseEnable, "value": courseValue}
      }
    };
    var header = {"Content-Type": "application/json"};
    var body = json.encode(payload);
    var response = await http.post(url, headers: header, body: body);
    var data = json.decode(response.body);
    var data2 = json.decode(data['d']);
    print(data2.runtimeType);
    print(data2['total']);
    return response.body;
  }
}