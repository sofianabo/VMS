import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';

class DashboardFirstRow extends StatelessWidget {
  const DashboardFirstRow({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
   
    return Row(
      children: [
        HoverScaleCard(
          child: Container(
            padding:
                EdgeInsets.only(top: 20.0, left: 32.0, right: 32.0, bottom: 20),
            decoration: BoxDecoration(
                color: Get.theme.cardColor,
                border: Border.all(color: Colors.grey, width: 0.2),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 1)
                ]),
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 60,
                  foregroundImage: AssetImage("../../images/Rectangle66.png"),
                ),
                Column(
                  children: [
                    Text("Welcome Laith Haitham Azzam"),
                    Text("Have A Nice Day At Work"),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: IconButton(
                                  style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () async {},
                                  icon: Icon(
                                    Icons.notifications_none_outlined,
                                    size: 18,
                                    color: Get.theme.primaryColor,
                                  ))),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Container(
                                alignment: Alignment.center,
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 2),
                                          blurRadius: 1)
                                    ]),
                                child: IconButton(
                                    style: ButtonStyle(
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))))),
                                    onPressed: () async {},
                                    icon: Icon(
                                      Icons.dark_mode_outlined,
                                      size: 18,
                                      color: Get.theme.primaryColor,
                                    ))),
                          ),
                          Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: IconButton(
                                  style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () async {},
                                  icon: Icon(
                                    Icons.edit_note_sharp,
                                    size: 18,
                                    color: Get.theme.primaryColor,
                                  ))),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        HoverScaleCard(
          child: Container(
               width:width/3.95,
              height: 160,
              padding: EdgeInsets.all(13.0),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Color(0xff235789),
                  border: Border.all(color: Colors.grey, width: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 1)
                  ]),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    "../../images/doctor.png",
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                        child: Text(
                          "Illness and Epidemics",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              ButtonDashboard(
                                  bordercolor: Colors.white,
                                  text: "Illness",
                                  onPressed: () {},
                                  color: Color(0xff4C779F),
                                  width: 150),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ButtonDashboard(
                                    bordercolor: Colors.white,
                                    text: "Epidemics",
                                    onPressed: () {},
                                    color: Color(0xff4C779F),
                                    width: 150),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )),
        ),
        HoverScaleCard(
          child: Container(
               width:width/3.95,
              height: 160,
              padding: EdgeInsets.all(13.0),
              decoration: BoxDecoration(
                  color: Color(0xffFE8686),
                  border: Border.all(color: Colors.grey, width: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 1)
                  ]),
              child: Stack(
                children: [
                  Image.asset(
                    "../../images/party.png",
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                        child: Text(
                          "Rewards and Penalties",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              ButtonDashboard(
                                  bordercolor: Colors.white,
                                  text: "Rewards",
                                  onPressed: () {},
                                  color: Color(0xffFE9E9E),
                                  width: 150),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ButtonDashboard(
                                    bordercolor: Colors.white,
                                    text: "Penalties",
                                    onPressed: () {},
                                    color: Color(0xffFE9E9E),
                                    width: 150),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
