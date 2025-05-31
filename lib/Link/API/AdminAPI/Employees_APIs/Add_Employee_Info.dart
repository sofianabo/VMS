import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';

class Add_Employee_Information {
  static Dio dio = Dio();

  static Future<dynamic> Add_Employee_Info({
    required String First_Name,
    required String Last_Name,
    required String Father_Name,
    required String Mother_Name,
    required String Phone_Numper,
    required String Emergency_Number,
    required String Address,
    required String Current_Address,
    required String Birth_Date,
    required String Gender,
    required String Family_State,
    Uint8List? selectedImage,
    String? Facebook_URL,
    String? X_Platform_URL,
    String? Linkedin_URL,
    String? Instagram_URL,
    String? Bank_Account_Title,
    String? Bank_Name,
    String? Bank_Branch_Name,
    String? Bank_Account_Number,
    String? IFSC_Code,
    String? Career_History,
    String? Qualification,
    String? Experience,
    String? Note,
    String? Password,
  }) async {
    String myURI = "$hostPort$addEmployeeInfo";
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      FormData formData = FormData.fromMap({
        "firstName": First_Name,
        "lastName": Last_Name,
        "fatherName": Father_Name,
        "motherName": Mother_Name,
        "gender": Gender,
        "birthDate": Birth_Date,
        "phone": Phone_Numper,
        "emergencyNumber": Emergency_Number,
        "familystatus": Family_State,
        "currentAddress": Current_Address,
        "address": Address,
        "qualification": Qualification,
        "experience": Experience,
        "note": Note,
        "bankAccountTitle": Bank_Account_Title,
        "bankName": Bank_Name,
        "bankBranchName": Bank_Branch_Name,
        "bankAccountNumber": Bank_Account_Number,
        "IFSCCode": IFSC_Code,
        "facebookUrl": Facebook_URL,
        "twitterUrl": X_Platform_URL,
        "lenkedinUrl": Linkedin_URL,
        "instagramUrl": Instagram_URL,
        "careerHistory": Career_History,
        "password": Password,
      });

      if (selectedImage != null) {
        formData.files.add(MapEntry(
          "file",
          MultipartFile.fromBytes(selectedImage, filename: "profile.jpg"),
        ));
      }

      var response = await dio.post(
        cancelToken: cancelToken,
        myURI,
        data: formData,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        gets.Get.back();
        prefs!.setBool("hasData", true);
        prefs!.setString("fullname", "$First_Name $Last_Name");
        gets.Get.find<AdminHomeContentController>().updateContent("Dashboard");
        gets.Get.find<Add_Data_controller>().removeimage();
        gets.Get.find<Add_Data_controller>().sethasData(true);
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
    } finally {
      gets.Get.back();
    }
    return null;
  }
}
