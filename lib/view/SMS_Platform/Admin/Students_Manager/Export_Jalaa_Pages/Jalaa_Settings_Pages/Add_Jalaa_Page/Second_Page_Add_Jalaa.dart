import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Jalaa_APIS/Gat_Curr_For_Sort.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Jalaa_APIS/Get_All_Class_Not_Has_Temp.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Jalaa_APIS/Get_All_Quiz_For_Jalaa.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';

class Second_Page_Add_Jalaa extends StatefulWidget {
  const Second_Page_Add_Jalaa({super.key});

  @override
  State<Second_Page_Add_Jalaa> createState() => _Second_Page_Add_JalaaState();
}

class _Second_Page_Add_JalaaState extends State<Second_Page_Add_Jalaa> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.7;

    int getCrossAxisCount() {
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 400) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 950) return 1.1;
      if (screenWidth >= 400) return 1.3;

      return 2.0;
    }

    return GetBuilder<Jalaa_Page_Controller>(
      builder: (controller) {
        if (controller.isClassLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.classes!.isNotEmpty) {
          return GridView.builder(
            padding:
                const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getCrossAxisCount(),
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: getChildAspectRatio()),
            itemCount: controller.classes!.length,
            itemBuilder: (context, index) {
              return HoverScaleCard(
                child: GestureDetector(
                  onTap: () {
                    controller.Classid = controller.classes![index].id!;
                    Get_Curr_For_Sort().Get_All_Curriculm();
                    Get_All_Quiz_For_Jalaa().Get_All_Quiz();
                    controller.nextPage();
                  },
                  child: Container(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5.0, bottom: 15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey, width: 0.5),
                          color: Theme.of(context).cardColor,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 1),
                                blurRadius: 0.5)
                          ]),
                      child: Center(
                        child: Text(
                          "${controller.classes![index].name}",
                        ),
                      )),
                ),
              );
            },
          );
        } else {
          return Center(child: Text("No Classes".tr));
        }
      },
    );
  }
}
