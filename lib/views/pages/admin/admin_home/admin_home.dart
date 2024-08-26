import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/border_button.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                  btnName: "Generate Report",
                  btnIcon: Image.asset('assets/generateReport.png',
                      width: 30, height: 30),
                  callback: () {
                    Navigator.pushNamed(context, "/admin/report");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
