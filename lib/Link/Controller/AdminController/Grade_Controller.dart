import 'package:get/get.dart';

class Grade_Controller extends GetxController {
  var Grades = [
    {
      "arName": "الفصل الأول",
      "enName": "First Grade",
      "feeCount": "150.000",
    },
    {
      "arName": "الفصل الأول",
      "enName": "First Grade",
      "feeCount": "150.000",
    },
    {
      "arName": "الفصل الأول",
      "enName": "First Grade",
      "feeCount": "150.000",
    },
  ].obs;

  DeleteGrade(int index) {
    Grades.removeAt(index);
    update();
  }

  UpdateGrade(int index, String arName, String enName, String feeCount) {
    Grades[index]['arName'] = arName;
    Grades[index]['enName'] = enName;
    Grades[index]['feeCount'] = feeCount;
    update();
  }

  addData(String arName, String enName, String feeCount) {
    Grades.addAll([
      {
        "arName": "$arName",
        "enName": "$enName",
        "feeCount": "$feeCount",
      }
    ]);
    update();
  }
}
