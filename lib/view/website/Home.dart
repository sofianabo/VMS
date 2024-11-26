import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/HomeScreenApI.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/website/Appbar.dart';
import 'package:vms_school/view/website/Section1.dart';
import 'package:vms_school/view/website/Section2.dart';
import 'package:vms_school/view/website/Section3.dart';
import 'package:vms_school/view/website/Section4.dart';
import 'package:vms_school/view/website/Section5.dart';
import 'package:vms_school/view/website/Section6.dart';
import 'package:vms_school/view/website/Section7.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  localeController loc = Get.put(localeController(), permanent: true);
  @override
  void initState() {
    Homescreenapi(context).homescreen();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: w,
          child: const Column(
            children: [
              AppbarCustom(),
              Section1(),
              Section2(),
              Section3(),
              Section4(),
              Section5(),
              Section6(),
              Section7(),
            ],
          ),
        ),
      ),
    );
  }
}
