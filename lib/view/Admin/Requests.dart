// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/view/Admin/RequestsGrid.dart';
import 'package:getx/widgets/Calender.dart';
import 'package:getx/widgets/DropDown.dart';
import 'package:getx/widgets/TextFormSearch.dart';

class Requests extends StatelessWidget {
  Requests({super.key});
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
       child: Column(
         children: [
           Container(
             margin: EdgeInsets.only(left: 30.0 , right: 30.0 , top: 30.0),
             alignment: Alignment.center,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                     Row(
                       children: [
                         DropDown(
                             title: "Status",
                             width: w / 5,
                             options: ['abbb', 'bfddfvd']),
                         Padding(
                           padding: const EdgeInsets.only(left: 20.0 , right: 20.0),
                           child: DatePicker(width:  w / 4.383,),
                         ),
                         TextFormSearch(
                           radius: 5,
                           controller: search,
                           suffixIcon: Icons.search,
                         ),
                       ],
                     ),
                     Spacer(),
                     Row(
                       children: [
                         Container(
                           width: 40,
                           height: 40,
                           decoration: BoxDecoration(
                               color:  Colors.white,
                               borderRadius: BorderRadius.circular(5),
                               boxShadow: const [
                                 BoxShadow(
                                     color: Colors.black12,
                                     offset:  Offset(0, 2),
                                     blurRadius: 1)
                               ]),
                           child: IconButton(
                               style: ButtonStyle(
                                   shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(Radius.circular(5))
                                   ))
                               ),
                               onPressed: () {},
                               icon:  Icon(
                                   VMS_Icons.xl
                                   ,
                                   size: 18,
                                   color:Get.theme.primaryColor
                               )),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(right: 10.0,left: 10.0),
                           child: Container(
                             width: 40,
                             height: 40,
                             decoration: BoxDecoration(
                                 color:  Colors.white,
                                 borderRadius: BorderRadius.circular(5),
                                 boxShadow: const [
                                   BoxShadow(
                                       color: Colors.black12,
                                       offset:  Offset(0, 2),
                                       blurRadius: 1)
                                 ]),
                             child: IconButton(
                                 style: ButtonStyle(

                                     shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                         borderRadius: BorderRadius.all(Radius.circular(5))
                                     ))
                                 ),
                                 onPressed: () {},
                                 icon:  Icon(
                                     VMS_Icons.pdf
                                     ,
                                     size: 18,
                                     color:Get.theme.primaryColor
                                 )),
                           ),
                         ),
                       ],
                     )
                   ],
                 ),
               ],
             ),
           ),
           Expanded(child:
           Padding(
                padding: const EdgeInsets.only(top: 15.0),
             child: RequestsGrid(),
           )),
         ],
       )

    );
  }
}
