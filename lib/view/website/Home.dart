import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/HomeScreenApI.dart';
import 'package:getx/Translate/local_controller.dart';
import 'package:getx/view/website/Appbar.dart';
import 'package:getx/view/website/Section1.dart';
import 'package:getx/view/website/Section2.dart';
import 'package:getx/view/website/Section3.dart';
import 'package:getx/view/website/Section4.dart';
import 'package:getx/view/website/Section5.dart';
import 'package:getx/view/website/Section6.dart';
import 'package:getx/view/website/Section7.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  localeController loc = Get.put(localeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    Homescreenapi(context).homescreen();
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
