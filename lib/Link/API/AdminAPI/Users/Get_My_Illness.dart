import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Illness_APIs/Get_All_Illness_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Functions/Show_Emp_Illnes_By_Id.dart';
import 'package:vms_school/Link/Functions/Show_Illnes_By_Id.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Students_Illness.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Get_My_Illness_API {
  final BuildContext context;
  final Dio dio = Dio();

  Get_My_Illness_API(this.context);

  Future<void> Get_My_Illness({employeeId}) async {
    final illnessController = Get.find<Illness_Controller>();

    illnessController.SetIsLoading(true);

    try {
      String apiUrl = "${hostPort}${getMyEmployeeIll}";

      var response = await dio.post(
        apiUrl,
        data: {"employeeId": employeeId},
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        await Get_Illness_API(context).Get_Illness();
        Students_Illness studentsIllness =
            Students_Illness.fromJson(response.data);
        illnessController.setIllnessSelected(studentsIllness);
        illnessController.SetIsLoading(false);
      } else {
        ErrorHandler.handleDioError(DioError(
          requestOptions: response.requestOptions,
          response: response,
          type: DioErrorType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioError) {
        ErrorHandler.handleDioError(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    } finally {
      illnessController.SetIsLoading(false);
    }
  }
}
