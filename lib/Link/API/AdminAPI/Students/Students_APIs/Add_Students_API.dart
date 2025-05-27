import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/GetAllStudentAPI.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Guardians_API/Get_My_Children_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Add_Student_API {
  Add_Student_API(this.context);
  BuildContext context;

  static Add_Student(
      {locationId,
      firstName,
      lastName,
      gender,
      birthDate,
      placeOfBirth,
      religion,
      mobileNumber,
      bloodType,
      fatherName,
      fatherPhone,
      motherName,
      currentAdress,
      familystatus,
      guardianId,
      userName,
      password,
      classid,
      divisionId,
      fatherWork,
      motherPhone,
      motherWork,
      nationalNumber,
      localID,
      lastSchoolDetail,
      note,
      specialNeeds,
      martyrSon,
      FatherPassport,
      MotherPassport,
      SonPassport,
      UserID,
      Certefecate,
      Academic_sequence,
      FamilyNotbook,
      file,
      illness,
      vaccine,
      Fee_Discount,
      idHist,
      previousClass}) async {
    Dio dio = Dio();
    String myURI = "${hostPort}${addStudentInfo}";

    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);

      Map<String, dynamic> formDataMap = {
        "locationId": locationId,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "birthDate": birthDate,
        "placeOfBirth": placeOfBirth,
        "religion": religion,
        "mobileNumber": mobileNumber,
        "bloodType": bloodType,
        "fatherName": fatherName,
        "fatherPhone": fatherPhone,
        "motherName": motherName,
        "currentAdress": currentAdress,
        "familystatus": familystatus,
        "userName": userName,
        "password": password,
        "fatherWork": fatherWork,
        "motherPhone": motherPhone,
        "motherWork": motherWork,
        "nationalNumber": nationalNumber,
        "localID": localID,
        "lastSchoolDetail": lastSchoolDetail,
        "note": note,
        "specialNeeds": specialNeeds == true ? 1 : 0,
        "martyrSon": martyrSon == true ? 1 : 0,
      };

      List<Map<String, dynamic>> files = [];

      if (FatherPassport != null) {
        files.add({
          "name": "FatherPassport",
          "file": MultipartFile.fromBytes(
            FatherPassport,
            filename: 'FatherPassport',
          )
        });
      }

      if (file != null) {
        formDataMap.addAll({
          "file": MultipartFile.fromBytes(
            file,
            filename: '$firstName ${lastName}Student Profile Image',
          )
        });
      }
      if (guardianId != null) {
        formDataMap.addAll({
          "guardianId": guardianId,
        });
      }
      if (Fee_Discount != null) {
        formDataMap.addAll({
          "feeDiscount": Fee_Discount,
        });
      }
      if (idHist != null) {
        formDataMap.addAll({
          "PublicRegisterNumber": idHist,
        });
      }
      if (previousClass != null) {
        formDataMap.addAll({
          "previousClass": previousClass,
        });
      }

      if (classid != null) {
        formDataMap.addAll({
          "classid": classid,
        });
      }

      if (divisionId != null) {
        formDataMap.addAll({
          "divisionId": divisionId,
        });
      }

      if (illness != null) {
        formDataMap.addAll({"illness": illness});
      }

      if (vaccine != null) {
        formDataMap.addAll({"vaccines": vaccine});
      }

      if (MotherPassport != null) {
        files.add({
          "name": "MotherPassport",
          "file": MultipartFile.fromBytes(
            MotherPassport,
            filename: 'MotherPassport',
          )
        });
      }

      if (SonPassport != null) {
        files.add({
          "name": "SonPassport",
          "file": MultipartFile.fromBytes(
            SonPassport,
            filename: 'SonPassport',
          )
        });
      }

      if (UserID != null) {
        files.add({
          "name": "UserID",
          "file": MultipartFile.fromBytes(
            UserID,
            filename: 'UserID',
          )
        });
      }

      if (Certefecate != null) {
        files.add({
          "name": "Certificate",
          "file": MultipartFile.fromBytes(
            Certefecate,
            filename: 'Certificate',
          )
        });
      }

      if (Academic_sequence != null) {
        files.add({
          "name": "AcademicSequence",
          "file": MultipartFile.fromBytes(
            Academic_sequence,
            filename: 'AcademicSequence',
          )
        });
      }

      if (FamilyNotbook != null) {
        files.add({
          "name": "Family Notebook",
          "file": MultipartFile.fromBytes(
            FamilyNotbook,
            filename: 'Family Notebook',
          )
        });
      }

      formDataMap.addAll({
        "documant": files,
      });

      FormData formData = FormData.fromMap(formDataMap);

      var response = await dio.post(
        myURI,
        data: formData,
        cancelToken: cancelToken,
        options: getDioOptions(),
      );
      if (response.statusCode == 200) {
        gets.Get.back();
        gets.Get.back();
        if (Fee_Discount != null) {
          Getallstudentapi.Getallstudent();
        } else {
          Get_My_Children_API().Get_My_Children();
        }
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 412) {
        gets.Get.back();
        gets.Get.find<Add_Students_Controller>()
            .updateFieldError("username", true);
      }
      if (e is DioException &&
          e.response?.statusCode == 400 &&
          e.response!.data['message']
              .contains("studentinfo_mobilenumber_unique")) {
        gets.Get.back();
        gets.Get.find<Add_Students_Controller>()
            .updateFieldError("phone", true);
        await Future.delayed(Duration(milliseconds: 100));
        gets.Get.snackbar(
          "خطأ",
          "رقم الهاتف مستخدم مسبقاً",
          snackPosition: gets.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      } else if (e is DioException) {
        ErrorHandler.handleDioError(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
