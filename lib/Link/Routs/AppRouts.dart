import 'package:get/get.dart';
import 'package:vms_school/Link/middleware/auth_middleware.dart';
import 'package:vms_school/view/Admin/AdminHome.dart';
import 'package:vms_school/view/Auth/Enroll_Screen.dart';
import 'package:vms_school/view/Auth/LoginScreen.dart';
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
      page: () => LoginScreen(),
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
  ];
}
