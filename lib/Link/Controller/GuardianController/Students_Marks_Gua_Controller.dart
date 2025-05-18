import 'package:get/get.dart';

import '../../Model/Guardian_Model/Students_Marks_Gua_Model.dart';

class Students_Marks_Gua_Controller extends GetxController {
  bool isLoading = true;
  Data? data;
  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  SetDataFromAPI(StudentsMarksModel stuma) {
    data = stuma.data;
    isLoading = false;
    update();
  }
}
