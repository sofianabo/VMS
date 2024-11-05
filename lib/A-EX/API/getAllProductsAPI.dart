// import '../Model/ProductsModel.dart';
// import 'package:http/http.dart' as http;

// class getAllProductsAPI {
//   static Future<List<ProductsModel>> getAllProducts() async {
//     var response =
//         await http.get(Uri.parse("https://fakestoreapi.com/products"));
//     if (response.statusCode == 200) {
//       var jsondata = response.body;
//       return profromjson(jsondata);
//     } else {
//       return throw Exception("Failed to load products");
//     }
//   }
// }
