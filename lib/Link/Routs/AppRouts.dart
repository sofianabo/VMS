import 'package:get/get.dart';
import 'package:vms_school/Link/middleware/auth_middleware.dart';
import 'package:vms_school/view/Admin/Admin_Main_Screens/AdminHome.dart';
import 'package:vms_school/view/Auth/Enroll_Screen.dart';
import 'package:vms_school/view/Auth/LoginScreen.dart';
import 'package:vms_school/view/Guardian/MainScreen/GuardinMainScreen.dart';
import 'package:vms_school/view/Registeration/Registeration_Home_Screens/Registeration_Home.dart';
import 'package:vms_school/view/Teacher/Teacher_Home/TeacherMainScreen.dart';
import 'package:vms_school/view/website/Home.dart';

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
