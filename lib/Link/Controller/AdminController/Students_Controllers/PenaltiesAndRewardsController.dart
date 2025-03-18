import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/PenaltyAPI/Get_All_Penalties_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Rewards_APIs/Get_All_Rewards_API.dart';
import 'package:vms_school/Link/Model/AdminModel/OneStudentAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Rewards_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/PenaltiesAndRewardsStudentModel.dart';

class Penaltiesandrewardscontroller extends GetxController {
  bool Rewards_isLoading = true;

  PenaltiesStudentModel? penaltiesModel;
  Rewards_Model? Rewardsmodel;
  bool isPenalityLoading = true;

  Future<void> fetchPenalties(int studentId) async {
    isPenalityLoading = true;
    update();

    penaltiesModel = await Get_All_Peanlitys_API().Get_All_Peanlitys(studentId);

    isPenalityLoading = false;
    update();
  }

  Future<void> fetchRewards(int studentId) async {
    set_Rewards_IsLoading(true);
    Rewardsmodel =
        await Get_All_Rewards_API().Get_All_Rewards(Student_ID: studentId);
    set_Rewards_IsLoading(false);
    update();
  }

  set_Rewards_IsLoading(bool value) {
    Rewards_isLoading = value;
    update();
  }

  Remove_Reward(int ixd) {
    Rewardsmodel!.prizes!.removeAt(ixd);
    update();
  }
}
