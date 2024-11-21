import 'package:get/get.dart';

class Labrary_Controller extends GetxController {
  List<Map<String, String>> books = [
    {'name': 'Laith Haitham Azzam'},
    {'name': 'Laith Haitham Azzam'},
    {'name': 'Laith Haitham Azzam'},
    {'name': 'Laith Haitham Azzam'},
    {'name': 'Laith Haitham Azzam'}
  ];

  Deletebook(int idx) {
    books.removeAt(idx);
    update();
  }
}
