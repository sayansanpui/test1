import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/border_button.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(context, false, false),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
        child: Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              BorderButton(
                  btnName: "Admin Login",
                  btnIcon: Image.asset('assets/adminLoginIcon.png',
                      width: 30, height: 30),
                  callback: () {
                    Navigator.pushNamed(context, "/faculty/classroom");
                  }),
              BorderButton(
                  btnName: "Faculty Login",
                  btnIcon: Image.asset('assets/account_circle.png',
                      width: 30, height: 30),
                  callback: () {
                    Navigator.pushNamed(context, "/faculty/classroom");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
