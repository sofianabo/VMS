import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/GridAnimation.dart';
import 'package:getx/widgets/VMSAlertDialog.dart';

class Virtual_User_Management_Grid extends StatelessWidget {
  List<Map<String, dynamic>> l = [
    {
      "name": "Laith Haitham Azzam",
      "roll": "Observer",
      "username": "Laith_Azzam_1",
    },
    {
      "name": "Laith Haitham Azzam",
      "roll": "Class",
      "username": "Laith_Azzam_1",
    },
  ];

  Virtual_User_Management_Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.4),
      itemCount: l.length, // عدد العناصر في الشبكة
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  style: ButtonStyle(
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
                                                "Do You Want To Delete ${l[index]['name']} Virtual User",
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal),
                                              ),
                                            ],
                                          )),
                                      apptitle: "Delete Employee",
                                      subtitle: "none",
                                    ));
                                  },
                                  icon: Icon(VMS_Icons.bin,
                                      size: 16, color: Colors.white)),
                              Text(
                                "${l[index]['roll']}",
                                style: TextStyle(
                                    color: l[index]['roll'] == "Observer"
                                        ? Color(0xff1EBC3B)
                                        : Color(0xff134B70),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${l[index]['name']}",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${l[index]['username']}",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ))
                        ]))));
      },
    );
  }
}
