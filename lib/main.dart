import 'package:flutter/material.dart';
import 'package:my_app/views/pages/admin/admin_generate_report/admin_generate_report.dart';
import 'package:my_app/views/pages/admin/admin_home/admin_home.dart';
import 'package:my_app/views/pages/admin/admin_login/admin_login.dart';
import 'package:my_app/views/pages/admin/admin_otp_page/admin_otp.dart';
import 'package:my_app/views/pages/admin/admin_register/admin_register.dart';
import 'package:my_app/views/pages/faculty/faculty_classroom/classroom_create.dart';
import 'package:my_app/views/pages/faculty/faculty_classroom/classroom_takeattendance.dart';
import 'package:my_app/views/pages/faculty/faculty_classroom/faculty_classroom.dart';
import 'package:my_app/views/pages/faculty/faculty_generate_report/faculty_generate_report.dart';
import 'package:my_app/views/pages/faculty/faculty_home/faculty_home.dart';
import 'package:my_app/views/pages/faculty/faculty_login/faculty_login.dart';
import 'package:my_app/views/pages/faculty/faculty_register/faculty_register.dart';
import 'package:my_app/views/pages/front_page/front_page.dart';
import 'package:my_app/views/pages/faculty/faculty_otp_page/faculty_otp.dart';
import 'package:my_app/views/pages/profile/profile.dart';
// import 'package:my_app/views/pages/faculty/faculty_login/faculty_login.dart';
// import 'package:my_app/views/pages/profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      routes: {
        "/": (context) => FrontPage(),
        "/admin/login": (context) => AdminLogin(),
        "/admin/register": (context) => AdminRegister(),
        "/admin/otp": (context) => AdminOtp(),
        "/admin/home": (context) => AdminHome(),
        "/admin/report": (context) => AdminGenerateReport(),
        "/faculty/login": (context) => FacultyLogin(),
        "/faculty/register": (context) => FacultyRegister(),
        "/faculty/otp": (context) => FacultyOtp(),
        "/faculty/home": (context) => FacultyHome(),
        "/profile": (context) => Profile(),
        "/faculty/classroom": (context) => FacultyClassroom(),
        "/faculty/create/classroom": (context) => ClassroomCreate(),
        "/faculty/create/takeattendance": (context) =>
            ClassroomTakeattendance(),
        "/faculty/report": (context) => FacultyGenerateReport(),
      },
    );
  }
}
