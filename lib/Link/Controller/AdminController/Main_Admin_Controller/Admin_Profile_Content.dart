import 'package:get/get.dart';

class Admin_Profile_Content extends GetxController {
  String curruntValue = "Profile";

  bool enabledPublicInfo = false;
  bool enabledMoreInfo = false;
  bool enabledSocilaMediaInfo = false;
  bool enabledBanlInfo = false;
  bool enabledEmailInfo = false;
  bool enabledPasswordInfo = false;
  bool enabledchangeemaildInfo = false;

  ChangeCurruntValue(String value) {
    curruntValue = value;
    update();
  }

  ChangeenabledPublicInfo(bool value) {
    enabledPublicInfo = value;
    update();
  }

  ChangeenabledchangeemaildInfo(bool value) {
    enabledchangeemaildInfo = value;
    update();
  }

  ChangeenabledMoreInfo(bool value) {
    enabledMoreInfo = value;
    update();
  }

  ChangeenabledSocilaMediaInfo(bool value) {
    enabledSocilaMediaInfo = value;
    update();
  }

  ChangeenabledBanlInfo(bool value) {
    enabledBanlInfo = value;
    update();
  }

  ChangeenabledEmailInfo(bool value) {
    enabledEmailInfo = value;
    update();
  }

  ChangeenabledPasswordInfo(bool value) {
    enabledPasswordInfo = value;
    update();
  }
}
