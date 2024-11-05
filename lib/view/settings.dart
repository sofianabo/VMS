// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx/Translate/local_controller.dart';
// import 'package:getx/Theme/themeController.dart';
// import 'package:getx/Theme/themeMode.dart';
// import 'package:getx/main.dart';

// class SettingsView extends StatelessWidget {
//   SettingsView({super.key});
//   localeController lc = Get.find();
//   themeController th = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "22".tr,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: ListView(
//         children: [
//           GetBuilder<themeController>(
//               init: themeController(),
//               builder: (con) {
//                 return Container(
//                   height: 140,
//                   margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                         color: con.th == theme.darktheme
//                             ? Colors.amberAccent
//                             : Colors.amberAccent,
//                         width: 5),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 20.0, right: 20, top: 3),
//                         child: Text("23".tr),
//                       ),
//                       RadioListTile(
//                           activeColor: Colors.amberAccent,
//                           title: Text("24".tr),
//                           value: "ar",
//                           groupValue: lang!.getString("lang"),
//                           onChanged: (val) {
//                             lc.changelang("ar");
//                           }),
//                       RadioListTile(
//                           activeColor: Colors.amberAccent,
//                           title: Text("25".tr),
//                           value: "en",
//                           groupValue: lang!.getString("lang"),
//                           onChanged: (val) {
//                             lc.changelang("en");
//                           })
//                     ],
//                   ),
//                 );
//               }),
//           Container(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20.0, right: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "26".tr,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   GetBuilder(
//                       init: themeController(),
//                       builder: (con) {
//                         return Switch(
//                             value: mode!.getBool("mode")!,
//                             onChanged: (val) {
//                               if (Get.isDarkMode) {
//                                 con.changetheme(val);
//                                 print(mode!.getBool("mode"));
//                               }
//                               if (!Get.isDarkMode) {
//                                 con.changetheme(val);
//                                 print(mode!.getBool("mode"));
//                               }
//                             });
//                       })
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
