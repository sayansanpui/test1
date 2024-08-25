import 'package:flutter/material.dart';
import 'package:my_app/views/pages/faculty/faculty_classroom/classroom_create.dart';
import 'package:my_app/views/pages/faculty/faculty_classroom/faculty_classroom.dart';
import 'package:my_app/views/pages/faculty/faculty_home/faculty_home.dart';
import 'package:my_app/views/pages/faculty/faculty_login/faculty_login.dart';
import 'package:my_app/views/pages/front_page/front_page.dart';
import 'package:my_app/views/pages/otp_page/otp_page.dart';
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
        "/faculty/login": (context) => FacultyLogin(),
        "/faculty/otp": (context) => OtpPage(),
        "/faculty/home": (context) => FacultyHome(),
        "/faculty/classroom": (context) => FacultyClassroom(),
        "/profile": (context) => Profile(),
        "/create/classroom": (context) => ClassroomCreate(),
        "/admin/login": (context) => FacultyLogin(),
      },
    );
  }
}
