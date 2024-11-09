// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:getx/view/Admin/EditEmployee.dart';
import 'package:getx/widgets/ButtonsDialog.dart';

class AllEmployeeGrid extends StatelessWidget {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
  ];

  AllEmployeeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.1),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 2),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 10), blurRadius: 10)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red[700]),
                      child: Center(
                          child: IconButton(
                        onPressed: () {
                          Get.dialog(AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.white,
                            title: Text(
                              "Delete Empolyee",
                              style: Get.theme.primaryTextTheme.bodyLarge,
                            ),
                            content: SizedBox(
                                width: 400,
                                height: 40,
                                child: Text(
                                  "Do you want to delete Laith Azzam",
                                  style: Get.theme.primaryTextTheme.bodyMedium,
                                )),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ButtonDialog(
                                    width: 100,
                                      text: "Delete",
                                      color: Colors.red,
                                      onPressed: () {}),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ButtonDialog(
                                    width: 100,
                                      text: "Cancel",
                                      color: Get.theme.colorScheme.primary,
                                      onPressed: () {
                                        Get.back();
                                      }),
                                ],
                              )
                            ],
                          ));
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.white,
                      )),
                    ),
                    Image.asset("../../images/Home-Background2.png",
                        height: 70, width: 70),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff19478d)),
                      child: Center(
                          child: IconButton(
                        onPressed: () {
                          EditEmployeeDialog();
                        },
                        icon: const Icon(Icons.edit),
                        color: Colors.white,
                      )),
                    ),
                  ],
                ),
                Text("Laith Azzam",
                    style: Get.theme.primaryTextTheme.bodyMedium),
                Text(
                  "Admin",
                  style: Get.theme.primaryTextTheme.titleSmall,
                ),
                Text("E-mail:", style: Get.theme.primaryTextTheme.bodySmall),
                Text("Mobile:", style: Get.theme.primaryTextTheme.bodySmall),
              ],
            ));
      },
    );
  }
}
