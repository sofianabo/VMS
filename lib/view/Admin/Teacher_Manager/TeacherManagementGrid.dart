import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/DeleteTeacherAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetTeacherById.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/EditTeacherInfo.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class TeacherManagementGrid extends StatelessWidget {
  const TeacherManagementGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allteachercontroller>(builder: (control) {
      return control.isLoading == true
          ? GridView.builder(
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
              itemCount: 8,
              itemBuilder: (context, index) {
                return HoverScaleCard(
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
                              SchemaWidget(width: 40, height: 40),
                              SchemaWidget(
                                width: 100,
                                height: 100,
                                radius: 100,
                              ),
                            ],
                          ),
                          SchemaWidget(width: 80, height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: SchemaWidget(width: 80, height: 10),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: SchemaWidget(width: 80, height: 10),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: SchemaWidget(width: 80, height: 10),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: SchemaWidget(width: 80, height: 10),
                          ),
                        ],
                      )),
                );
              },
            ).animate(onPlay: (controller) => controller.repeat()).shimmer(
              angle: 1,
              color: Colors.grey.withOpacity(0.2),
              duration: const Duration(seconds: 1),
              delay: const Duration(seconds: 1))
          : GridView.builder(
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
              itemCount:
                  control.filteredTeacher!.length, // عدد العناصر في الشبكة
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: GestureDetector(
                    onTap: () async {
                      if (control.filteredTeacher![index].hasEmployee == true) {
                        await GetteacherbyidAPI.Getteacherbyid(
                            TeacherId:
                                control.filteredTeacher![index].id.toString(),
                            context: context,
                            index: index);
                      } else {
                        Get.dialog(VMSAlertDialog(
                          action: [],
                          contents: const Text("This Teacher Not Have Data"),
                          apptitle: "This Teacher Not Uploaded his/her Data",
                          subtitle: "none",
                        ));
                      }
                      print(control.filteredTeacher![index].id.toString());
                    },
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
                                    style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Color(0xffB03D3D)),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))))),
                                    onPressed: () {
                                      Get.dialog(VMSAlertDialog(
                                        action: [
                                          ButtonDialog(
                                              text: "Delete",
                                              onPressed: () async {
                                                await Deleteteacherapi(context)
                                                    .Deleteteacher(control
                                                        .filteredTeacher![index]
                                                        .id!);
                                              },
                                              color: const Color(0xffB03D3D),
                                              width: 80),
                                          ButtonDialog(
                                              text: "Cancel",
                                              onPressed: () {
                                                Get.back();
                                              },
                                              color: Get.theme.primaryColor,
                                              width: 80)
                                        ],
                                        contents: SizedBox(
                                            width: 500,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Do You Want To Delete ${control.filteredTeacher![index].fullName} Teacher",
                                                  style: Get.theme.textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                ),
                                              ],
                                            )),
                                        apptitle: "Delete Student",
                                        subtitle: "none",
                                      ));
                                    },
                                    icon: const Icon(VMS_Icons.bin,
                                        size: 16, color: Colors.white)),
                                Image.asset("../../images/Rectangle66.png",
                                    height: 100, width: 100),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                  "${control.filteredTeacher![index].fullName}",
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                      "${control.filteredTeacher![index].contractType}",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: control
                                                          .filteredTeacher![
                                                              index]
                                                          .contractType ==
                                                      "Full Time"
                                                  ? const Color(0xff2F9742)
                                                  : Get.theme.primaryColor)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                      "${control.filteredTeacher![index].gender}",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Get.theme.primaryColor)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                  "Mobile : ${control.filteredTeacher![index].phone}",
                                  style:
                                      Get.theme.textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                  "Email : ${control.filteredTeacher![index].email}",
                                  style:
                                      Get.theme.textTheme.bodyMedium!.copyWith(
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
