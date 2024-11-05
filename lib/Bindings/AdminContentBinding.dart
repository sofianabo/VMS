import 'package:get/get.dart';
import 'package:getx/Controller/AdminController/AdminHomeContentController.dart';

class AdminContentBinding extends Bindings{
  @override
  void dependencies() {
        Get.put(AdminHomeContentController());  
  }
}