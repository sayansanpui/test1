import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/minirounded_button.dart';
import 'package:my_app/views/widgets/text_menu.dart';

class FacultyLogin extends StatefulWidget {
  const FacultyLogin({super.key});

  @override
  _FacultyLoginState createState() => _FacultyLoginState();
}

class _FacultyLoginState extends State<FacultyLogin> {
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
      appBar: AppBarWidget(context, false, "Faculty Login"),
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
                      const Text("Faculty Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 20),
                      TextMenu(
                        labelName: "Email",
                        hint: "Enter your college mail",
                        onChanged: updateEmail,
                        width: screenWidth,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MiniroundedButton(
                            btnName: "Register",
                            width: 150, // Adjust width as needed
                            callback: () {
                              Navigator.pushNamed(context, "/faculty/register");
                            },
                          ),
                          MiniroundedButton(
                            btnName: "Log in",
                            width: 150, // Adjust width as needed
                            callback: () {
                              Navigator.pushNamed(context, "/faculty/otp");
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
