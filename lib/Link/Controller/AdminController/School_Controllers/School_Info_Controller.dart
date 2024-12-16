import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchoolInfoController extends GetxController {
  List<String> listCountry = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];
  List<String> listWork_Type = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];

  var Outstanding_School = false.obs;
  var Taken_OverSchool = false.obs;
  var Reassignment_Teachers = false.obs;
  var Martyrs_Sons = false.obs;
  var Internet_Connection = false.obs;
  var Government_Connection = false.obs;
  var Joint_Building = false.obs;
  var Industrial_Section = false.obs;


  TextEditingController School_Name = TextEditingController();
  TextEditingController License_Number = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController Village = TextEditingController();
  TextEditingController Region = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Creation_Year = TextEditingController();
  TextEditingController Clinic_Name = TextEditingController();
  TextEditingController Congregation_number = TextEditingController();
  TextEditingController Previous_name = TextEditingController();
  TextEditingController Town_Chip = TextEditingController();
  TextEditingController Fax = TextEditingController();
  TextEditingController Work_Begin_Year = TextEditingController();


  initialdata() {
    School_Name.text = SchoolInfo[0]["School_Name"];
    License_Number.text = SchoolInfo[0]["License_Number"];
    Address.text = SchoolInfo[0]["Address"];
    Village.text = SchoolInfo[0]["Village"];
    Region.text = SchoolInfo[0]["Region"];
    Phone.text = SchoolInfo[0]["Phone"];
    Email.text = SchoolInfo[0]["Email"];
    Creation_Year.text = SchoolInfo[0]["Creation_Year"];
    Clinic_Name.text = SchoolInfo[0]["Clinic_Name"];
    Congregation_number.text = SchoolInfo[0]["Congregation_number"];
    Previous_name.text = SchoolInfo[0]["Previous_name"];
    Town_Chip.text = SchoolInfo[0]["Town_Chip"];
    Fax.text = SchoolInfo[0]["Fax"];
    Work_Begin_Year.text = SchoolInfo[0]["Work_Begin_Year"];
    Outstanding_School.value = SchoolInfo[0]['Outstanding_School'];
    Taken_OverSchool.value = SchoolInfo[0]['Taken_OverSchool'];
    Reassignment_Teachers.value = SchoolInfo[0]['Reassignment_Teachers'];
    Martyrs_Sons.value = SchoolInfo[0]['Martyrs_Sons'];
    Internet_Connection.value = SchoolInfo[0]['Internet_Connection'];
    Government_Connection.value = SchoolInfo[0]['Government_Connection'];
    Joint_Building.value = SchoolInfo[0]['Joint_Building'];
    Industrial_Section.value = SchoolInfo[0]['Industrial_Section'];
  }

  List<Map<String, dynamic>> SchoolInfo = [
    {
      "School_Name": "مدرسة الافتراضية الحديثة",
      "License_Number": "12345789",
      "Address": "السويداء - بناء المهندسين",
      "Village": "السويداء",
      "Region": "السويداء",
      "Phone": "01112345678",
      "Email": "info@school.com",
      "Creation_Year": "1995",
      "Clinic_Name": "عيادة الصحة المدرسية",
      "Congregation_number": "120",
      "Previous_name": "مدرسة الأمل",
      "Town_Chip": "شريحة المدينة",
      "Fax": "01187654321",
      "Work_Begin_Year": "1995",
      "Country": "الجمهورية العربية السورية",
      "Work_Type": "تعليم حكومي",
      "Outstanding_School": true,
      "Taken_OverSchool": false,
      "Reassignment_Teachers": true,
      "Martyrs_Sons": false,
      "Internet_Connection": true,
      "Government_Connection": true,
      "Joint_Building": false,
      "Industrial_Section": false,
    },
  ];

  String CountryIndex = "";
  String Work_TypeIndex = "";

  updatedat(
      School_Name,
      License_Number,
      Address,
      Village,
      Region,
      Phone,
      Email,
      Creation_Year,
      Clinic_Name,
      Congregation_number,
      Previous_name,
      Town_Chip,
      Fax,
      Work_Begin_Year) {
    SchoolInfo[0] = {
      "School_Name": "$School_Name",
      "License_Number": "$License_Number",
      "Address": "$Address",
      "Village": "$Village",
      "Region": "$Region",
      "Phone": "$Phone",
      "Email": "$Email",
      "Creation_Year": "$Creation_Year",
      "Clinic_Name": "$Clinic_Name",
      "Congregation_number": "$Congregation_number",
      "Previous_name": "$Previous_name",
      "Town_Chip": "$Town_Chip",
      "Fax": "$Fax",
      "Work_Begin_Year": "$Work_Begin_Year",
      "Country": CountryIndex,
      "Work_Type": Work_TypeIndex,
      "Outstanding_School": Outstanding_School.toString(),
      "Taken_OverSchool": Taken_OverSchool.toString(),
      "Reassignment_Teachers": Reassignment_Teachers.toString(),
      "Martyrs_Sons": Martyrs_Sons.toString(),
      "Internet_Connection": Internet_Connection.toString(),
      "Government_Connection": Government_Connection.toString(),
      "Joint_Building": Joint_Building.toString(),
      "Industrial_Section": Industrial_Section.toString(),
    };
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'Country':
        CountryIndex = index ?? "";
        break;
      case 'Work_Type':
        Work_TypeIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'Country':
        listCountry = options;
        break;
      case 'Work_Type':
        listWork_Type = options;
        break;
    }
    update();
  }

  String get selectCountryIndex => CountryIndex;

  String get selectWork_TypeIndex => Work_TypeIndex;
}
