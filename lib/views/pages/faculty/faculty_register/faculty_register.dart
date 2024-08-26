import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/dropdown_menu.dart';
import 'package:my_app/views/widgets/numtext_menu.dart';
import 'package:my_app/views/widgets/rounded_button.dart';
import 'package:my_app/views/widgets/text_menu.dart';

class FacultyRegister extends StatefulWidget {
  const FacultyRegister({super.key});

  @override
  _FacultyRegisterState createState() => _FacultyRegisterState();
}

class _FacultyRegisterState extends State<FacultyRegister> {
  String email = '';
  String inputTotalStudents = '';
  String? department;
  String? classType;

  void updateEmail(String? newValue) {
    setState(() {
      email = newValue ?? '';
    });
  }

  void updateDepartment(String? newValue) {
    setState(() {
      department = newValue;
    });
  }

  void updateClassType(String? newValue) {
    setState(() {
      classType = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarWidget(context, false, "Faculty Register"),
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
                      const Text("Faculty Register",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 20),
                      TextMenu(
                        labelName: "Full Name",
                        hint: "Enter your full name",
                        onChanged: updateEmail,
                        width: screenWidth,
                      ),
                      const SizedBox(height: 20),
                      NumTextMenu(
                        labelName: "Phone Number",
                        onChanged: (String? value) {
                          setState(() {
                            inputTotalStudents = value ?? '';
                          });
                        },
                        hint: "Enter your phone number",
                        width: screenWidth,
                      ),
                      const SizedBox(height: 20),
                      DropdownMenu_(
                        labelName: "Home Department",
                        hint: "Select Department",
                        onChanged: updateDepartment,
                        searchKey: "",
                        width: screenWidth,
                        items: ["IT", "CSE", "ECE", "EEE", "MECH", "CIVIL"],
                      ),
                      const SizedBox(height: 20),
                      DropdownMenu_(
                          labelName: "Post",
                          hint: "Select Class Type",
                          onChanged: updateClassType,
                          searchKey: "",
                          width: screenWidth,
                          items: ["Professor", "Assistant Professor"]),
                      const SizedBox(height: 30),
                      RoundedButton(
                          btnName: "Register",
                          callback: () {
                            Navigator.pushNamed(context, "/faculty/login");
                          }),
                      const SizedBox(height: 30),
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