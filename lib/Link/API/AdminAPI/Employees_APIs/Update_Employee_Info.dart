import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Get_My_Profile.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Update_Employee_Information {
  static Dio dio = Dio();

  static Future<dynamic> Update_Employee_Info({
    required String Type,
    String? First_Name,
    String? Last_Name,
    String? Father_Name,
    String? Mother_Name,
    String? Phone_Numper,
    String? Emergency_Number,
    String? Address,
    String? Current_Address,
    String? Birth_Date,
    String? Gender,
    String? Family_State,
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
    bool? deletedImg,
  }) async {
    String myURI = "$hostPort$updateEmployee";
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      FormData formData = FormData.fromMap({
        if (First_Name != null) "firstName": First_Name,
        if (Last_Name != null) "lastName": Last_Name,
        if (Father_Name != null) "fatherName": Father_Name,
        if (Mother_Name != null) "motherName": Mother_Name,
        if (Gender != null) "gender": Gender,
        if (Birth_Date != null) "birthDate": Birth_Date,
        if (Phone_Numper != null) "phone": Phone_Numper,
        if (Emergency_Number != null) "emergencyNumber": Emergency_Number,
        if (Family_State != null) "familystatus": Family_State,
        if (Current_Address != null) "currentAddress": Current_Address,
        if (Address != null) "address": Address,
        if (Qualification != null) "qualification": Qualification,
        if (Experience != null) "experience": Experience,
        if (Note != null) "note": Note,
        if (Bank_Account_Title != null) "bankAccountTitle": Bank_Account_Title,
        if (Bank_Name != null) "bankName": Bank_Name,
        if (Bank_Branch_Name != null) "bankBranchName": Bank_Branch_Name,
        if (Bank_Account_Number != null)
          "bankAccountNumber": Bank_Account_Number,
        if (IFSC_Code != null) "IFSCCode": IFSC_Code,
        if (Facebook_URL != null) "facebookUrl": Facebook_URL,
        if (X_Platform_URL != null) "twitterUrl": X_Platform_URL,
        if (Linkedin_URL != null) "lenkedinUrl": Linkedin_URL,
        if (Instagram_URL != null) "instagramUrl": Instagram_URL,
        if (Career_History != null) "careerHistory": Career_History,
      });

      if (selectedImage != null) {
        formData.files.add(MapEntry(
          "file",
          MultipartFile.fromBytes(selectedImage, filename: "profile.jpg"),
        ));
      } else {
        if (deletedImg == true) {
          formData.fields.add(MapEntry("deletedImg", "true"));
        }
      }

      var response = await dio.post(
        cancelToken: cancelToken,
        myURI,
        data: formData,
        options: getDioOptions(),
      );

      if (response.statusCode == 200) {
        gets.Get.find<Admin_Profile_Content>().ChangeenabledPublicInfo(false);
        gets.Get.find<Admin_Profile_Content>()
            .ChangeenabledchangeemaildInfo(false);
        gets.Get.find<Admin_Profile_Content>().ChangeenabledMoreInfo(false);
        gets.Get.find<Admin_Profile_Content>()
            .ChangeenabledSocilaMediaInfo(false);
        gets.Get.find<Admin_Profile_Content>().ChangeenabledBanlInfo(false);
        gets.Get.find<Admin_Profile_Content>().ChangeenabledEmailInfo(false);
        gets.Get.find<Admin_Profile_Content>().ChangeenabledPasswordInfo(false);
        gets.Get.find<Add_Data_controller>().removeimage();
        Get_My_Profile.Get_My_Profile_Data();
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
