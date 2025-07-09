import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Jalaa_APIS/Get_All_Class_Not_Has_Temp.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Jalaa_Settings_Pages/Add_Jalaa_Settings_Dialog.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Jalaa_Settings_Pages/Jalaa_Grid.dart';

class Jalaa_Up_Page extends StatefulWidget {
  const Jalaa_Up_Page({super.key});

  @override
  State<Jalaa_Up_Page> createState() => _Jalaa_Up_PageState();
}

class _Jalaa_Up_PageState extends State<Jalaa_Up_Page> {
  @override
  void initState() {
    // GetAllGuardiansAPI(context).getAllGuardian();
    // TODO: implement initState
    super.initState();
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: w,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.spaceBetween,
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                GetBuilder<Jalaa_Page_Controller>(builder: (controller) {
                  return TextFormSearch(
                    click: () {
                      // controller.clearFilter();
                    },
                    onchange: (value) {
                      // controller.searchJalaa(value);
                    },
                    width: w >= 732 ? w * 0.7 : w * 0.9,
                    radius: 5,
                    controller: search,
                    suffixIcon:
                        search.text.isNotEmpty ? Icons.close : Icons.search,
                  );
                }),
                Row(
                  spacing: 8.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Squer_Button_Enabled_Disabled(
                      onTap: () {
                        Get_All_Class_Not_Has_Temp().Get_All_Classes();
                        Get.find<Jalaa_Page_Controller>().initialData();
                        Get.dialog(Dialog_Add_Jalaa_Settings());
                      },
                      icon: Icons.add,
                      validate:
                          Get.find<Add_Data_controller>().roll == "subAdmin",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: All_Jalaas_Grid(),
        )),
      ],
    );
  }
}
