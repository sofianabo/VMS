import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Delete_Reward_API {
  Dio dio = Dio();
  Delete_Reward({required int Rewards_ID, required int ixd}) async {
    String myURI = "$hostPort$deleteStudentPrize";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      var response = await dio.post(myURI,
          cancelToken: cancelToken,
          data: {"id": Rewards_ID},
          options: getDioOptions());
      if (response.statusCode == 200) {
        Get.find<Penaltiesandrewardscontroller>().Remove_Reward(ixd);
        Get.back();
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
