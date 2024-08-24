import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/dropdown_menu.dart';

class ClassroomCreate extends StatefulWidget {
  const ClassroomCreate({super.key});

  @override
  State<ClassroomCreate> createState() => _ClassroomCreateState();
}

class _ClassroomCreateState extends State<ClassroomCreate> {
  String? department_name;
  String? section;
  String? subject_name;

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
              SizedBox(
                height: 20,
              ),
              DropdownMenu_(
                labelName: "Section",
                onChanged: updateSection,
                searchKey: "",
                width: screenWidth,
                firstItem: "NA",
                items: ["A", "B", "C"],
              ),
              SizedBox(
                height: 20,
              ),
              DropdownMenu_(
                labelName: "Subject Name",
                onChanged: updateSubjectName,
                searchKey: "",
                width: screenWidth,
                items: ["Maths", "Physics", "Chemistry", "Biology", "English"],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
