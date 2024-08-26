import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/minirounded_button.dart';
import 'package:my_app/views/widgets/text_menu.dart';

class FacultyOtp extends StatefulWidget {
  const FacultyOtp({super.key});

  @override
  _FacultyOtpState createState() => _FacultyOtpState();
}

class _FacultyOtpState extends State<FacultyOtp> {
  String email = '';

  void updateEmail(String? newValue) {
    setState(() {
      email = newValue ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarWidget(context, false, "OTP Verification"),
      body: Center(
        child: SizedBox(
          width: 600,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text("OTP Verification",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 20),
                      TextMenu(
                        labelName: "OTP",
                        hint: "Enter OTP",
                        onChanged: updateEmail,
                        width: screenWidth,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MiniroundedButton(
                            btnName: "Resend",
                            width: 150, // Adjust width as needed
                            callback: () {
                              // Navigator.pushNamed(context, "/");
                            },
                          ),
                          MiniroundedButton(
                            btnName: "Verify",
                            width: 150, // Adjust width as needed
                            callback: () {
                              Navigator.pushNamed(context, "/faculty/home");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
