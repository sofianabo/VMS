import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownPenaltyController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllPenaltyModel.dart';
import '../../API.dart' as global;
import 'package:vms_school/Link/API/DioOption.dart';

class Dropdownpenaltyapi {
  Dropdownpenaltycontroller c = Get.find<Dropdownpenaltycontroller>();
  BuildContext context;
  Dropdownpenaltyapi(this.context);
  Dio dio = Dio();

  Dropdownpenalty() async {
    try {
      String myurl = "${global.hostPort}${global.allPenalty}";
      var response = await dio.get(myurl, options: getDioOptions());
      if (response.statusCode == 200) {
        AllPenaltyModel penalty = AllPenaltyModel.fromJson(response.data);
        c.setPenalty(penalty);
        return penalty;
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
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}
