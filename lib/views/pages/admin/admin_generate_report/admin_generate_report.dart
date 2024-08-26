import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/date_menu.dart';
import 'package:my_app/views/widgets/dropdown_menu.dart';
import 'package:my_app/views/widgets/multipleselect_menu.dart';
import 'package:my_app/views/widgets/numtext_menu.dart';
import 'package:my_app/views/widgets/rounded_button.dart';
import 'package:my_app/views/widgets/text_menu.dart';

class AdminGenerateReport extends StatefulWidget {
  const AdminGenerateReport({super.key});

  @override
  State<AdminGenerateReport> createState() => _AdminGenerateReportState();
}

class _AdminGenerateReportState extends State<AdminGenerateReport> {
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
  String? date;

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

  void onChanged(String? newValue) {
    setState(() {
      date = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarWidget(context, true, "Generate Report"),
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
                      const Text("Report",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(height: 20),
                      DateMenu(labelName: "Date", onChanged: onChanged),
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
                      MultipleSelectMenu(
                        labelName: 'Period',
                        hint: 'Select Period',
                        items: [
                          '1st',
                          '2nd',
                          '3rd',
                          '4th',
                          '5th',
                          '6th',
                          '7th',
                          '8th',
                          'SPC',
                        ],
                        onChanged: (selectedItems) {
                          print('Selected Items: $selectedItems');
                        },
                        searchKey: 'name',
                      ),
                      const SizedBox(height: 20),
                      TextMenu(
                        labelName: "Special Case",
                        hint: "Comment here",
                        onChanged: onChanged,
                        width: screenWidth,
                        height: 120,
                      ),
                      const SizedBox(height: 20),
                      NumTextMenu(
                        labelName: "Total Attendance",
                        onChanged: (String? value) {
                          setState(() {
                            inputTotalStudents = value ?? '';
                          });
                        },
                        hint: "Enter total attendance",
                        width: screenWidth,
                      ),
                      const SizedBox(height: 30),
                      RoundedButton(
                          btnName: "Submit",
                          callback: () {
                            // Navigator.pushNamed(context, "/");
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
