import 'package:flutter/material.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Jalaa_Settings_Pages/Jalaa_App_Page.dart';

class JalaaTestPage extends StatefulWidget {
  const JalaaTestPage({super.key});

  @override
  State<JalaaTestPage> createState() => _JalaaTestPageState();
}

class _JalaaTestPageState extends State<JalaaTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Jalaa_Up_Page(),
    );
  }
}
