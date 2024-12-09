import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudentModel.dart';
import 'package:pdf/widgets.dart';
import 'package:vms_school/Link/Model/AdminModel/OneStudentAttendenceModel.dart';

class Onestudentattendencecontroller extends GetxController {
  late BuildContext context;
  List<StudentAt> studentAtt = [];
  bool isLoading = true;
  
  void setStudentAttendence(OneStudentAttendenceModel model) {
    studentAtt = model.studentAt!;
    setIsLoading(false);
    update();
  }

  setIsLoading(bool value){
    isLoading = value;
    update();
  }
 }
