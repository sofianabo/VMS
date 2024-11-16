import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/Link/Controller/AdminController/AllTeacherController.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import '../../widgets/DropDown.dart';
import '../../widgets/GridAnimation.dart';
import '../../widgets/VMSAlertDialog.dart';

class TeacherManagementGrid extends StatelessWidget {
  TeacherManagementGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allteachercontroller>(builder: (controller) {
      return GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Get.width <= 1226 && Get.width >= 988
                ? 3
                : Get.width <= 987 && Get.width >= 759
                    ? 2
                    : Get.width <= 758
                        ? 1
                        : 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: Get.width <= 1226 && Get.width >= 988
                ? 2.2
                : Get.width <= 987 && Get.width >= 759
                    ? 2.7
                    : Get.width <= 758 && Get.width >= 573
                        ? 3.8
                        : Get.width <= 573
                            ? 3.0
                            : 0.9),
        itemCount: controller.teachers.length, // عدد العناصر في الشبكة
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 1)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Color(0xffB03D3D)),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                Get.dialog(VMSAlertDialog(
                                  action: [
                                    ButtonDialog(
                                        text: "Delete",
                                        onPressed: () {},
                                        color: Color(0xffB03D3D),
                                        width: 80),
                                    ButtonDialog(
                                        text: "Cancel",
                                        onPressed: () {
                                          Get.back();
                                        },
                                        color: Get.theme.primaryColor,
                                        width: 80)
                                  ],
                                  contents: Container(
                                      width: 500,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Do You Want To Delete ${controller.teachers[index].fullName} Teacher",
                                            style: Get.theme.primaryTextTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ),
                                        ],
                                      )),
                                  apptitle: "Delete Student",
                                  subtitle: "none",
                                ));
                              },
                              icon: Icon(VMS_Icons.bin,
                                  size: 16, color: Colors.white)),
                          Image.asset("../../images/Rectangle66.png",
                              height: 100, width: 100),
                          IconButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Get.theme.primaryColor),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                Get.dialog(VMSAlertDialog(
                                    contents: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        DropDown(
                                            width: 220,
                                            title: "Class",
                                            options: []),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: DropDown(
                                              width: 220,
                                              title: "Curriculum",
                                              options: []),
                                        ),
                                      ],
                                    ),
                                    action: [
                                      ButtonDialog(
                                          width: 120,
                                          text: "Save",
                                          onPressed: () {},
                                          color: Get.theme.primaryColor)
                                    ],
                                    apptitle: "Link Teacher To Curriculum",
                                    subtitle: "none"));
                              },
                              icon: Icon(Icons.link,
                                  size: 18, color: Colors.white)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("${controller.teachers[index].fullName}",
                            style: Get.theme.primaryTextTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                                "${controller.teachers[index].contractType}",
                                style: Get.theme.primaryTextTheme.bodySmall!
                                    .copyWith(
                                        fontSize: 16,
                                        color: controller.teachers[index]
                                                    .contractType ==
                                                "Full Time"
                                            ? Color(0xff2F9742)
                                            : Get.theme.primaryColor)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text("${controller.teachers[index].gender}",
                                style: Get.theme.primaryTextTheme.bodySmall!
                                    .copyWith(
                                        fontSize: 16,
                                        color: Get.theme.primaryColor)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                            "Mobile : ${controller.teachers[index].phone}",
                            style:
                                Get.theme.primaryTextTheme.bodySmall!.copyWith(
                              fontSize: 16,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                            "Email : ${controller.teachers[index].email}",
                            style:
                                Get.theme.primaryTextTheme.bodySmall!.copyWith(
                              fontSize: 14,
                            )),
                      ),
                    ],
                  )),
            ),
          );
        },
      );
    });
  }
}
