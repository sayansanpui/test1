import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/dropdown_menu.dart';
import 'package:my_app/views/widgets/numtext_menu.dart';
import 'package:my_app/views/widgets/rounded_button.dart';

class ClassroomCreate extends StatefulWidget {
  const ClassroomCreate({super.key});

  @override
  State<ClassroomCreate> createState() => _ClassroomCreateState();
}

class _ClassroomCreateState extends State<ClassroomCreate> {
  String? department_name;
  String? section;
  String? subject_name;
  String? subject_code;
  String? session;
  String? year;
  String? semester;
  String? semester_type;
  String? class_type;
  String inputTotalStudents = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    void updateDepartmentName(String? newValue) {
      setState(() {
        department_name = newValue;
      });
    }

    void updateSection(String? newValue) {
      setState(() {
        section = newValue;
      });
    }

    void updateSubjectName(String? newValue) {
      setState(() {
        subject_name = newValue;
      });
    }

    void updateSubjectCode(String? newValue) {
      setState(() {
        subject_code = newValue;
      });
    }

    void updateSession(String? newValue) {
      setState(() {
        session = newValue;
      });
    }

    void updateYear(String? newValue) {
      setState(() {
        year = newValue;
      });
    }

    void updateSemester(String? newValue) {
      setState(() {
        semester = newValue;
      });
    }

    void updateSemesterType(String? newValue) {
      setState(() {
        semester_type = newValue;
      });
    }

    void updateClassType(String? newValue) {
      setState(() {
        class_type = newValue;
      });
    }

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarWidget(context, true, "Create Classroom"),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Classroom Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(height: 20),
                      DropdownMenu_(
                        labelName: "Department in which taken class",
                        hint: "Select Department",
                        onChanged: updateDepartmentName,
                        searchKey: "",
                        width: screenWidth,
                        items: ["IT", "CSE", "ECE", "EEE", "MECH", "CIVIL"],
                      ),
                      const SizedBox(height: 20),
                      DropdownMenu_(
                        labelName: "Section",
                        hint: "Select Section",
                        onChanged: updateSection,
                        searchKey: "",
                        width: screenWidth,
                        items: ["A", "B", "C", "D", "NA"],
                      ),
                      const SizedBox(height: 20),
                      DropdownMenu_(
                        labelName: "Subject Name",
                        hint: "Select Subject Name",
                        onChanged: updateSubjectName,
                        searchKey: "",
                        width: screenWidth,
                        items: [
                          "Compiler Design",
                          "Data Structures",
                          "DBMS",
                          "OS"
                        ],
                      ),
                      const SizedBox(height: 20),
                      DropdownMenu_(
                          labelName: "Subject Code",
                          hint: "Select Subject Code",
                          onChanged: updateSubjectCode,
                          searchKey: "",
                          width: screenWidth,
                          items: [
                            "PCC-CS-401",
                            "PCC-CS-402",
                            "PCC-CS-403",
                            "PCC-CS-404"
                          ]),
                      const SizedBox(height: 20),
                      DropdownMenu_(
                          labelName: "Session",
                          hint: "Select Session",
                          onChanged: updateSession,
                          searchKey: "",
                          width: screenWidth,
                          items: ["2022-2023", "2023-2024", "2024-2025"]),
                      const SizedBox(height: 20),
                      DropdownMenu_(
                          labelName: "Year",
                          hint: "Select Year",
                          onChanged: updateYear,
                          searchKey: "",
                          width: screenWidth,
                          items: ["1st", "2nd", "3rd", "4th"]),
                      const SizedBox(height: 20),
                      DropdownMenu_(
                          labelName: "Semester Type",
                          hint: "Select Semester Type",
                          onChanged: updateSemesterType,
                          searchKey: "",
                          width: screenWidth,
                          items: ["Odd", "Even"]),
                      const SizedBox(height: 20),
                      DropdownMenu_(
                          labelName: "Semester",
                          hint: "Select Semester",
                          onChanged: updateSemester,
                          searchKey: "",
                          width: screenWidth,
                          items: [
                            "1st",
                            "2nd",
                            "3rd",
                            "4th",
                            "5th",
                            "6th",
                            "7th",
                            "8th"
                          ]),
                      const SizedBox(height: 20),
                      DropdownMenu_(
                          labelName: "Class Type",
                          hint: "Select Class Type",
                          onChanged: updateClassType,
                          searchKey: "",
                          width: screenWidth,
                          items: ["Theory", "Lab"]),
                      const SizedBox(height: 20),
                      NumTextMenu(
                        labelName: "Total Students",
                        onChanged: (String? value) {
                          setState(() {
                            inputTotalStudents = value ?? '';
                          });
                        },
                        hint: "Enter total students",
                        width: screenWidth,
                      ),
                      const SizedBox(height: 30),
                      RoundedButton(
                          btnName: "Submit",
                          callback: () {
                            print("Department Name: $department_name");
                            print("Section: $section");
                            print("Subject Name: $subject_name");
                            print("Subject Code: $subject_code");
                            print("Session: $session");
                            print("Year: $year");
                            print("Semester: $semester");
                            print("Semester Type: $semester_type");
                            print("Class Type: $class_type");
                            print("Total Students: $inputTotalStudents");
                            print("Email: $email");
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
