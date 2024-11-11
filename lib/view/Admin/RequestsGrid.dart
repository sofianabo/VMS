// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/ButtonsGrid.dart';

class RequestsGrid extends StatelessWidget {
  RequestsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.only(left: 30.0 , right: 30.0),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 25.0,
            mainAxisSpacing: 25.0,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            return
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey,width: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset:  Offset(0, 2),
                          blurRadius: 1)
                    ]
                ),
                child: Padding(
                  padding:const EdgeInsets.only(left: 8.0 , right: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Guardian Info:",style: Get.theme.primaryTextTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.normal
                            ),),
                            Text("2024/1/13"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("Name : Haitham Azzam",style: Get.theme.primaryTextTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("Mobile: 0936119623",style: Get.theme.primaryTextTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("Email: baraamarwan2005@gmail.com",style: Get.theme.primaryTextTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("National ID: 130200192929",style: Get.theme.primaryTextTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("Student Info:",style: Get.theme.primaryTextTheme.titleSmall!.copyWith(

                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("Name : Laith Azzam",style: Get.theme.primaryTextTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0 , bottom: 15.0),
                        child: Text("Grade Level: Twelveth scientific grade",style: Get.theme.primaryTextTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal
                        ),),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ButtonsGrid(
                            color: Get.theme.primaryColor,
                            width: 100 ,
                            height: 40,
                            text: "Manage",
                            onPressed: (){
                              Get.dialog(
                                  VMSAlertDialog(
                                      action: [
                                        ButtonDialog(
                                          text: 'Reject',
                                          onPressed: () {  },
                                          width: 80,
                                          color: Color(0xffB03D3D),
                                        ),
                                        ButtonDialog(
                                          text: 'Approve',
                                          onPressed: () {  },
                                          width: 80,
                                          color: Get.theme.primaryColor,
                                        )
                                      ],
                                      contents: Row(
                                        children: [
                                          DropDown(
                                            width: Get.width/5.2,
                                            options: [
                                              "ads"
                                            ],
                                            title: 'Class',
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(left: 20.0),
                                            child: DropDown(
                                              width: Get.width/5.2,
                                              options: [
                                                "ads"
                                              ],
                                              title: 'Division',
                                            ),
                                          )
                                        ],
                                      ),
                                      apptitle: 'Manage Student',
                                      subtitle: 'Manage Laith Azzam Student'
                                  )
                              );
                            },
                          ),
                          Text("Pending",style: Get.theme.primaryTextTheme.titleSmall!.copyWith(
                              color: Color(0xff779DB6),
                              fontWeight: FontWeight.normal
                          ),),
                        ],
                      )
                    ],
                  ),
                ),
              );
          },
        ),
      );
  }
}
