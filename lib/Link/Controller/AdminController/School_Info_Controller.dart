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

  List<Map<String, dynamic>> SchoolInfo = [
    {
      "School_Name": "الفصل الأول",
      "License_Number": "First Division",
      "Address": "Twelfth Scientific Grade",
      "Village": "يشفش",
      "Region": "يشفش",
      "Phone": "يشفش",
      "Email": "يشفش",
      "Creation_Year": "يشفش",
      "Clinic_Name": "يشفش",
      "Congregation_number": "يشفش",
      "Previous_name": "يشفش",
      "Town_Chip": "يشفش",
      "Fax": "يشفش",
      "Work_Begin_Year": "يشفش",
      "Country": "يشفش",
      "Work_Type": "يشفش",
      "Outstanding_School": false,
      "Taken_OverSchool": false,
      "Reassignment_Teachers": false,
      "Martyrs_Sons": false,
      "Internet_Connection": false,
      "Government_Connection": false,
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
