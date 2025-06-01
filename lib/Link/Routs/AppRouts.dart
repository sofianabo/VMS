import 'package:get/get.dart';
import 'package:vms_school/Link/middleware/auth_middleware.dart';
import 'package:vms_school/view/LMS_Platform/Admin/Admin_Main_Screens/Admin_Home_LMS.dart';
import 'package:vms_school/view/LMS_Platform/Admin/Selected_Class_Screen.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Admin_Main_Screens/AdminHome.dart';
import 'package:vms_school/view/Both_Platform/Auth/Enroll_Screen.dart';
import 'package:vms_school/view/Both_Platform/Auth/LoginScreen.dart';
import 'package:vms_school/view/SMS_Platform/Guardian/MainScreen/GuardinMainScreen.dart';
import 'package:vms_school/view/SMS_Platform/Registeration/Registeration_Home_Screens/Registeration_Home.dart';
import 'package:vms_school/view/SMS_Platform/Teacher/Teacher_Home/TeacherMainScreen.dart';
import 'package:vms_school/view/Both_Platform/website/Home.dart';

import '../../view/Both_Platform/website/Home.dart' show Home;

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => Home(),
      middlewares: [RoleBasedMiddleware()],
    ),
    GetPage(
      name: '/admin',
      page: () => AdminHome(),
      middlewares: [RoleBasedMiddleware()],
    ),
    GetPage(
      name: '/adminLMS',
      page: () => Admin_Home_LMS(),
      middlewares: [RoleBasedMiddleware()],
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(), //GuardianMainScreen()
      middlewares: [RoleBasedMiddleware()],
    ),
    GetPage(
      name: '/home',
      page: () => Home(),
      middlewares: [RoleBasedMiddleware()],
    ),
    GetPage(
      name: '/enroll',
      page: () => EnrollScreen(),
      middlewares: [RoleBasedMiddleware()],
    ),
    GetPage(
      name: '/guardian',
      page: () => GuardianMainScreen(),
      middlewares: [RoleBasedMiddleware()],
    ),
    GetPage(
      name: '/teacher',
      page: () => TeacherMainScreen(),
      middlewares: [RoleBasedMiddleware()],
    ),
    GetPage(
      name: '/registration',
      page: () => RegisterationHome(),
      middlewares: [RoleBasedMiddleware()],
    ),
  ];
}
