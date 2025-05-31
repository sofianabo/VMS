// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Rewards_Controller.dart';
// import 'package:vms_school/Link/Functions/Export_Rewards.dart';
//
// GlobalKey RewardsGloballKey = GlobalKey();
//
// class RewardsGrid extends StatefulWidget {
//   const RewardsGrid({super.key});
//
//   @override
//   State<RewardsGrid> createState() => _RewardsGridState();
// }
//
// class _RewardsGridState extends State<RewardsGrid> {
//   @override
//   void initState() {
//     final controller = Get.find<RewardsController>();
//     if (controller.Certificats.isNotEmpty) {
//       controller.selectImage(controller.Certificats.first['image']);
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<RewardsController>(
//       init: Get.find<RewardsController>(),
//       builder: (controller) {
//         return GestureDetector(
//           onTap: controller.deselectText,
//           child: SingleChildScrollView(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 35),
//                   width: 300,
//                   height: 600,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff134B70),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       children: controller.Certificats.map((certificate) {
//                         return GestureDetector(
//                           onTap: () {
//                             controller.selectImage(certificate['image']);
//                           },
//                           child: SvgPicture.asset(
//                             certificate['image'],
//                             width: 300,
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//
//                 // منطقة التصميم الرئيسية
//                 RepaintBoundary(
//                   key: RewardsGloballKey,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Theme.of(context).primaryColor),
//                     ),
//                     width: 850,
//                     height: 600,
//                     child: Stack(
//                       children: [
//                         // الخلفية (صورة الشهادة المختارة)
//                         SvgPicture.asset(
//                           controller.selectedImage,
//                           fit: BoxFit.fitWidth,
//                           key: ValueKey(
//                               controller.selectedImage), // لإعادة البناء
//                         ),
//
//                         // العناصر القابلة للسحب والتحرير
//                         for (int i = 0; i < controller.textOverlays.length; i++)
//                           DraggableText(
//                             onDelete: () => controller.deleteText(i),
//                             overlay: controller.textOverlays[i],
//                             onUpdate: (updatedOverlay) =>
//                                 controller.updateTextOverlay(i, updatedOverlay),
//                             onSelect: () => controller.selectText(i),
//                             isSelected: controller.selectedTextIndex == i,
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 // لوحة الأدوات
//                 Expanded(
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 25),
//                     decoration: BoxDecoration(
//                       color: const Color(0xff134B70),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(top: 15.0),
//                             child: Text(
//                               "Tools",
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//
//                           // زر إضافة النص
//                           _buildToolButton(
//                             icon: Icons.text_increase_outlined,
//                             label: "Add Text",
//                             onPressed: controller.addTextOverlay,
//                           ),
//
//                           // زر تصدير إلى PDF
//                           _buildToolButton(
//                             icon: Icons.picture_as_pdf,
//                             label: "Export As Pdf",
//                             onPressed: () async {
//                               await saveRewardsAsPdf(
//                                   key: RewardsGloballKey, saveLocal: true);
//                             },
//                           ),
//
//                           // زر إضافة قالب جديد
//                           _buildToolButton(
//                             icon: Icons.temple_hindu,
//                             label: "Add New Template",
//                             onPressed: () {},
//                           ),
//
//                           // زر الحفظ
//                           _buildToolButton(
//                             icon: Icons.save,
//                             label: "Save",
//                             onPressed: () {
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// // ويدجت المساعدة لإنشاء أزرار الأدوات
// Widget _buildToolButton({
//   required IconData icon,
//   required String label,
//   required VoidCallback onPressed,
// }) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
//     child: TextButton(
//       onPressed: onPressed,
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.white),
//           const SizedBox(width: 6.0),
//           Expanded(
//             child: Text(
//               label,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
