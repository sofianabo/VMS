import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/Theme/ThemeData.dart';
import 'package:vms_school/view/Admin/Search_Bar_widget.dart';

class AppbarAdmin extends StatefulWidget {
  AppbarAdmin({super.key});

  @override
  State<AppbarAdmin> createState() => _AppbarAdminState();
}

class _AppbarAdminState extends State<AppbarAdmin> {
  var controller = Get.find<Add_Data_controller>();
  TextEditingController serch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 77,
        margin: const EdgeInsets.only(right: 60, left: 30, top: 29),
        width: w,
        child: Row(
          children: [
            GetBuilder<AdminHomeContentController>(builder: (cont) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.hasData) {
                        Get.find<AdminHomeContentController>()
                            .updateContent("My Profile");
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        color: controller.hasData
                            ? Colors.white
                            : Theme.of(context).disabledColor,
                        border: Border.all(color: Color(0xffDAD0D0)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                "Laith Haitham Azzam",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 3.0, bottom: 3.0),
                            child: Image.asset(
                              "../../images/Rectangle66.png",
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: SearchWithSuggestions(
                        enabled: controller.hasData,
                        onItemSelected: (value) {
                          cont.updateContent(value);
                        },
                      )),
                ],
              );
            }),
            Expanded(
              child: GetBuilder<AdminHomeContentController>(builder: (cont) {
                return Center(
                  child: Text(
                    cont.content.tr,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).highlightColor),
                  ),
                );
              }),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  Theme.of(context) == theme.Dark_Theme
                      ? "../../images/logodark.svg"
                      : "../../images/logolight.svg",
                  width: 250,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
