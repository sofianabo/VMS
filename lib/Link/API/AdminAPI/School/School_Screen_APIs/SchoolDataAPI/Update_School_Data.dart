import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/SchoolDataAPI/School_Data_API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/School_Data_Model.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Update_School_Data_API {
  Update_School_Data_API(this.context);
  BuildContext context;
  Dio dio = Dio();
  Update_School_Data() async {
    String myURI = "$hostPort$updatSchoolData";
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);
      final controller = Get.find<SchoolInfoController>();
      var response = await dio.post(myURI,
          data: {
            "countryId": controller.data?.country?.id != null
                ? controller.countruId == 0
                    ? controller.data!.country!.id
                    : controller.countruId
                : 10,
            "schoolName": controller.School_Name.text,
            "licenseNumber": controller.License_Number.text,
            "congregationNumber": controller.Congregation_number.text,
            "previousName": controller.Previous_name.text,
            "address": controller.ArabicAddress.text,
            "enAddress": controller.EnglishAddress.text,
            "village": controller.ArabicVillage.text,
            "enVillage": controller.EnglishVillage.text,
            "township": controller.Town_Chip.text,
            "region": controller.Region.text,
            "phone": controller.Phone.text,
            "fax": controller.Fax.text,
            "email": controller.Email.text,
            "creatYear": controller.Creation_Year.text,
            "workBeginYear": controller.Work_Begin_Year.text,
            'Morning': controller.morning.value,
            'Evening': controller.evening.value,
            "clinicName": controller.Clinic_Name.text,
            "internetConnection": controller.Internet_Connection.value,
            "governmentConnection": controller.Government_Connection.value,
            "industrialSection": controller.Industrial_Section.value,
            "jointBuilding": controller.Joint_Building.value,
            "martyrsSons": controller.Martyrs_Sons.value,
            "outstandingSchool": controller.Outstanding_School.value,
            "takenOverSchool": controller.Taken_OverSchool.value,
            "reassignmentTeachers": controller.Reassignment_Teachers.value,
            "MorningWorkingHours":
                "${controller.morningStartTime.value},${controller.morningEndTime.value}",
            "EveningWorkingHours":
                "${controller.eveningStartTime.value},${controller.eveningEndTime.value}",
            "whatsAppNumber": controller.whatsapp.text,
            "urlYoutube": controller.youtube.text,
            "urlFaceBook": controller.facebook.text,
          },
          options: getDioOptions());
      if (response.statusCode == 200) {
        School_Data_Model schoolDataModel =
            School_Data_Model.fromJson(response.data);
        controller.setData(schoolDataModel.data);
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
    } catch (e) {
      if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    } finally {
      Get.back();
    }
  }
}
