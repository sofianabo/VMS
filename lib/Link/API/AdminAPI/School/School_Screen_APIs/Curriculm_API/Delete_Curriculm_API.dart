// import 'package:vms_school/Link/API/API.dart';
// import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
// import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Grade_Screen_API.dart';
// import 'package:vms_school/Link/API/DioOption.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:vms_school/Link/API/Error_API.dart';
// import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
// import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
// import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
// import 'package:vms_school/widgets/Loading_Dialog.dart';
//
// class Delete_Curriculm_API {
//   BuildContext context;
//   Delete_Curriculm_API(this.context);
//   Dio dio = Dio();
//
//   Delete_Curriculm(
//       {
//         index,
//         classId,
//       }
//       ) async {
//
//     try {
//       CancelToken cancelToken = CancelToken();
//       Loading_Dialog(cancelToken: cancelToken);
//       final controller = Get.find<ClassMgmtController>();
//       String myurl = "${hostPort}${deleteClass}";
//
//       var response = await dio.post(
//         cancelToken: cancelToken,
//           myurl,
//           data: {
//           "classId":classId
//           },
//           options: getDioOptions());
//       if (response.statusCode == 200) {
//         await Get_All_Curriculm_API(context).Get_All_Curriculm(sessionID: Get.find<All_Screen_Sessions_Controller>().sessionId);
//         Get.back();
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
//     }finally{
//      Get.back();
//     }
//   }
// }
