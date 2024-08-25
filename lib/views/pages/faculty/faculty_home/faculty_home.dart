import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/border_button.dart';

class FacultyHome extends StatefulWidget {
  const FacultyHome({super.key});

  @override
  State<FacultyHome> createState() => _FacultyHomeState();
}

class _FacultyHomeState extends State<FacultyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(context, true, "Attendance Management"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
        child: Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              BorderButton(
                  btnName: "Classroom",
                  btnIcon: Image.asset('assets/classroom.png',
                      width: 30, height: 30),
                  callback: () {
                    Navigator.pushNamed(context, "/faculty/classroom");
                  }),
              BorderButton(
                  btnName: "Generate Report",
                  btnIcon: Image.asset('assets/generateReport.png',
                      width: 30, height: 30),
                  callback: () {
                    // Navigator.pushNamed(context, "/faculty/login");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
