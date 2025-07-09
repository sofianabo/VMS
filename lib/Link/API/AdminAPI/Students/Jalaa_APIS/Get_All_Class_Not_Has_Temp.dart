import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DioOption.dart' show getDioOptions;
import 'package:vms_school/Link/API/Error_API.dart' show ErrorHandler;
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Jalaa_Models/Class_Model.dart';

class Get_All_Class_Not_Has_Temp {
  Get_All_Class_Not_Has_Temp();
  Dio dio = Dio();
  Get_All_Classes() async {
    final controller = Get.find<Jalaa_Page_Controller>();

    try {
      controller.SetClassIsLoading(true);
      String myurl = "$hostPort$getClassNotjalaa";
      var response = await dio.post(myurl,
          data: {
            "sessionId":
                Get.find<All_Screen_Sessions_Controller>().sessionId ?? 1,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        Class_Jalaa allClassModel = Class_Jalaa.fromJson(response.data);
        controller.SetClasses(allClassModel);
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      print(e);
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
