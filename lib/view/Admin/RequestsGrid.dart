import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/RequestsController.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/ButtonsGrid.dart';
import 'package:vms_school/widgets/DropDown.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

import '../../widgets/GridAnimation.dart';

class RequestsGrid extends StatelessWidget {
  RequestsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Requestscontroller>(builder: (controller) {
      if(controller.IsLoading == true){
        return Container(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 25.0,
              mainAxisSpacing: 25.0,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              return HoverScaleCard(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SchemaWidget(width: 200,height: 20,),
                                  SchemaWidget(width: 100,height: 20,)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child:  SchemaWidget(width: 150,height: 20,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child:  SchemaWidget(width: 100,height: 20,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child:  SchemaWidget(width: 125,height: 20,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child:  SchemaWidget(width: 120,height: 20,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child:  SchemaWidget(width: 115,height: 20,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child:  SchemaWidget(width: 110,height: 20,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                              child:  SchemaWidget(width: 105,height: 20,),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SchemaWidget(width: 150,height: 40,radius: 10,),
                            SchemaWidget(width: 100,height: 20,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                  angle: 1,
                  color: Colors.white,
                  duration: Duration(seconds: 1),
                  delay: Duration(seconds: 1)),
                    Center(child: CircularProgressIndicator(
                      color:Color(0xffe6e7ea),
                      strokeCap: StrokeCap.round,
                    )),
                  ],
                ),
              );
            },
          ),
        );
      }
      else{
        return Container(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: controller.filteredregistration.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 25.0,
              mainAxisSpacing: 25.0,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              return HoverScaleCard(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Guardian Info:",
                                style: Get.theme.primaryTextTheme.titleSmall!
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                              Text(
                                  "${controller.filteredregistration[index].data}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Name : ${controller.filteredregistration[index].guardian?.name}",
                            style: Get.theme.primaryTextTheme.titleSmall!
                                .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Mobile: ${controller.filteredregistration[index].guardian?.mobile}",
                            style: Get.theme.primaryTextTheme.titleSmall!
                                .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Email: ${controller.filteredregistration[index].guardian?.email}",
                            style: Get.theme.primaryTextTheme.titleSmall!
                                .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "National ID: ${controller.filteredregistration[index].guardian?.nationalId}",
                            style: Get.theme.primaryTextTheme.titleSmall!
                                .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Student Info:",
                            style: Get.theme.primaryTextTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Name : ${controller.filteredregistration[index].student?.name}",
                            style: Get.theme.primaryTextTheme.titleSmall!
                                .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                          child: Text(
                            "Grade Level: ${controller.filteredregistration[index].student?.clas}",
                            style: Get.theme.primaryTextTheme.titleSmall!
                                .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonsGrid(
                              color: Get.theme.primaryColor,
                              width: 150,
                              height: 40,
                              text: "Manage",
                              onPressed: () {
                                Get.dialog(VMSAlertDialog(
                                    action: [
                                      ButtonDialog(
                                        text: 'Reject',
                                        onPressed: () {},
                                        width: 80,
                                        color: Color(0xffB03D3D),
                                      ),
                                      ButtonDialog(
                                        text: 'Approve',
                                        onPressed: () {},
                                        width: 80,
                                        color: Get.theme.primaryColor,
                                      )
                                    ],
                                    contents: Row(
                                      children: [
                                        DropDown(
                                          width: Get.width / 5.2,
                                          options: ["ads"],
                                          title: 'Class',
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 20.0),
                                          child: DropDown(
                                            width: Get.width / 5.2,
                                            options: ["ads"],
                                            title: 'Division',
                                          ),
                                        )
                                      ],
                                    ),
                                    apptitle: 'Manage Student',
                                    subtitle: 'Manage Laith Azzam Student'));
                              },
                            ),
                            Text(
                              "${controller.filteredregistration[index].type}",
                              style: Get.theme.primaryTextTheme.titleSmall!
                                  .copyWith(
                                  color: Color(0xff779DB6),
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
