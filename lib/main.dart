import 'package:flutter/material.dart';
import 'package:my_app/views/pages/faculty/faculty_classroom/classroom_create.dart';
import 'package:my_app/views/pages/faculty/faculty_classroom/faculty_classroom.dart';
import 'package:my_app/views/pages/front_page/front_page.dart';
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
      routes: {
        "/": (context) => FrontPage(),
        "/faculty/classroom": (context) => FacultyClassroom(),
        "/profile": (context) => Profile(),
        "/create/classroom": (context) => ClassroomCreate()

        // "/": (context) => FacultyClassroom(),
        // "/profile": (context) => Profile(),
        // "/create/classroom": (context) => ClassroomCreate()
      },
      // home: Container(
      //   color: Colors.white,
      //   child: FacultyClassroom(),
      // ),
    );
  }
}
