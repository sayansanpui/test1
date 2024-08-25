import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/dropdown_menu.dart';
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
  String? inputTotalStudents;

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
      backgroundColor: Colors.white,
      appBar: AppBarWidget(context, true, true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Classroom Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              DropdownMenu_(
                labelName: "Department in which taken class",
                onChanged: updateDepartmentName,
                searchKey: "",
                width: screenWidth,
                items: ["IT", "CSE", "ECE", "EEE", "MECH", "CIVIL"],
              ),
              SizedBox(height: 20),
              DropdownMenu_(
                labelName: "Section",
                onChanged: updateSection,
                searchKey: "",
                width: screenWidth,
                items: ["NA", "A", "B", "C"],
              ),
              SizedBox(height: 20),
              DropdownMenu_(
                labelName: "Subject Name",
                onChanged: updateSubjectName,
                searchKey: "",
                width: screenWidth,
                items: ["Compiler Design", "Data Structures", "DBMS", "OS"],
              ),
              SizedBox(height: 20),
              DropdownMenu_(
                  labelName: "Subject Code",
                  onChanged: updateSubjectCode,
                  searchKey: "",
                  width: screenWidth,
                  items: [
                    "PCC-CS-401",
                    "PCC-CS-402",
                    "PCC-CS-403",
                    "PCC-CS-404"
                  ]),
              SizedBox(height: 20),
              DropdownMenu_(
                  labelName: "Session",
                  onChanged: updateSession,
                  searchKey: "",
                  width: screenWidth,
                  items: ["2021-2022", "2022-2023", "2023-2024", "2024-2025"]),
              SizedBox(height: 20),
              DropdownMenu_(
                  labelName: "Year",
                  onChanged: updateYear,
                  searchKey: "",
                  width: screenWidth,
                  items: ["1st", "2nd", "3rd", "4th"]),
              SizedBox(height: 20),
              DropdownMenu_(
                  labelName: "Semester",
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
              SizedBox(height: 20),
              DropdownMenu_(
                  labelName: "Semester Type",
                  onChanged: updateSemesterType,
                  searchKey: "",
                  width: screenWidth,
                  items: ["Odd", "Even"]),
              SizedBox(height: 20),
              DropdownMenu_(
                  labelName: "Class Type",
                  onChanged: updateClassType,
                  searchKey: "",
                  width: screenWidth,
                  items: ["Theory", "Lab"]),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter total number of students",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    onChanged: (String value) {
                      inputTotalStudents = value;
                    },
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    decoration: InputDecoration(
                      hintText: "Enter total number of students",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 30, 30, 30),
                            width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                      }),
                  SizedBox(height: 30),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
