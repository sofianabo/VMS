// import 'package:dio/dio.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:vms_school/Link/API/API.dart';
// import 'package:vms_school/Link/API/Error_API.dart';
// import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
// import 'package:vms_school/Link/API/DioOption.dart';
// import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';
//
// class Get_All_Division_API {
//   BuildContext context;
//   Get_All_Division_API(this.context);
//   Dio dio = Dio();
//   Get_All_Division() async {
//     final controller = Get.find<Division_Controller>();
//     controller.setIsLoading(true);
//     try {
//       String myurl = "${hostPort}${getGrade}";
//       var response = await dio.get(myurl,
//           options: getDioOptions());
//       if (response.statusCode == 200) {
//        AllGradesModel allGradesModel = AllGradesModel.fromJson(response.data);
//        controller.setData(allGradesModel);
//       } else {
//         ErrorHandler.handleDioError(DioError(
//           requestOptions: response.requestOptions,
//           response: response,
//           type: DioErrorType.badResponse,
//         ));
//       }
//     } catch (e) {
//       if (e is DioError) {
//         ErrorHandler.handleDioError(e);
//       } else if (e is Exception) {
//         ErrorHandler.handleException(e);
//       } else {
//         ErrorHandler.handleException(Exception(e.toString()));
//       }
//     }
//   }
// }