// import 'package:get/get.dart';
// import 'package:getx/A-EX/API/getAllProductsAPI.dart';
// import 'package:getx/A-EX/Model/ProductsModel.dart';

// class getAllProductsController extends GetxController {
//   var productsList = <ProductsModel>[].obs;
//   var isloading = true.obs;
//   @override
//   void onInit() async {
//     getProducts();
//     super.onInit();
//   }

//   void getProducts() async {
//     var products = await getAllProductsAPI.getAllProducts();
//     try {
//       isloading(true);
//       if (products.isNotEmpty) {
//         productsList.addAll(products);
//       }
//     } finally {
//       isloading(false);
//     }
//   }
// }
