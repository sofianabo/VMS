import 'package:dio/dio.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Model/AdminModel/My_Data_Model.dart';
import 'package:get/get.dart';
import 'package:vms_school/main.dart';

class Get_My_Profile {
  static Dio dio = Dio();

  static Future<dynamic> Get_My_Profile_Data() async {
    final controller = Get.put(Add_Data_controller());
    String myURI = "$hostPort$getMyEmployee";
    controller.setIsloading(true);
    try {
      var response = await dio.get(
        myURI,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        My_Profile_Data my_profile_data =
            My_Profile_Data.fromJson(response.data);
        controller.setMyData(my_profile_data);
        prefs!.setString("imageId", my_profile_data.myData!.imageId.toString());

        controller.setIsloading(false);
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioException && e.type == DioExceptionType.cancel) {
      } else if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
