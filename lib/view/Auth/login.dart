// // ignore: must_be_immutable, camel_case_types
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx/API/LoginAPI.dart';
// import 'package:getx/Bindings/UserBinding.dart';
// import 'package:getx/Controller/UserController.dart';
// import 'package:getx/Theme/themeController.dart';
// import 'package:getx/main.dart';
// import 'package:getx/view/Admin/AdminHome.dart';
// import 'package:getx/widgets/TextFormSearch.dart';

// // ignore: camel_case_types, must_be_immutable, unused_element
// class Login extends StatelessWidget {
//   TextEditingController username = TextEditingController();
//   TextEditingController password = TextEditingController();
//   themeController th = Get.find();

//   Login({super.key});
//   @override
//   Widget build(BuildContext context) {
//     Get.put(UserController(), permanent: true);

//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             Image.asset(
//               "../../images/Home-Background.png",
//               fit: BoxFit.cover,
//               height: Get.height,
//               width: Get.width,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Image.asset(
//                   "../../images/Home-Background2.png",
//                   width: 400,
//                   height: 400,
//                 ),
//                 Opacity(
//                   opacity: 0.75,
//                   child: Center(
//                     child: Container(
//                       width: 350,
//                       height: 400,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.white38,
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.black54,
//                               offset: Offset(15, 15),
//                               blurRadius: 20,
//                               spreadRadius: 10),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               TextForm(
//                                   controller: username,
//                                   maxlength: 25,
//                                   labeltext: "Username".tr,
//                                   activeLabel: const Color(0xff19478d),
//                                   colorlabel: Colors.black,
//                                   prifexIcon: Icons.account_box,
//                                   prifexColor: const Color(0xff19478d),
//                                   focasBorder: const Color(0xff19478d)),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Center(
//                                 child: TextForm1(
//                                     controller: password,
//                                     maxlength: 10,
//                                     labeltext: "Password".tr,
//                                     activeLabel: const Color(0xff19478d),
//                                     colorlabel: Colors.black,
//                                     prifexIcon: Icons.lock,
//                                     prifexColor: const Color(0xff19478d),
//                                     focasBorder: const Color(0xff19478d)),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               MaterialButton(
//                                 onPressed: () async {
                                 
//                                 },
//                                 color: const Color(0xff19478d),
//                                 child: Text("Login".tr,
//                                     style:
//                                         const TextStyle(color: Colors.white)),
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Are you forget your password?".tr,
//                                     style: const TextStyle(
//                                         color: Colors.black, fontSize: 10),
//                                   ),
//                                   InkWell(
//                                     onTap: () {},
//                                     child: Text(
//                                       "Change it".tr,
//                                       style: const TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ));
//   }
// }
