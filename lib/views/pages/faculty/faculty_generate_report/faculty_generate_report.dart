import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/data_table.dart';
import 'package:my_app/views/widgets/date_menu.dart';
import 'package:my_app/views/widgets/dropdown_menu.dart';
import 'package:my_app/views/widgets/rounded_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;

import 'package:open_file/open_file.dart';

class FacultyGenerateReport extends StatefulWidget {
  const FacultyGenerateReport({super.key});

  @override
  State<FacultyGenerateReport> createState() => _FacultyGenerateReportState();
}

class _FacultyGenerateReportState extends State<FacultyGenerateReport> {
  String startingDate = "";
  String endingDate = "";
  String? year;
  String? semesterType;
  String? semester;
  String? department;
  String? section;
  String? subjectCode;
  String? date;
  String? session;
  String? sortBy;

  final List<String> columnHeaders = [
    'ID',
    'Name',
    'Age',
    'ID1',
    'Name1',
    'Age1',
    'ID2',
    'Name2',
    'Age2'
  ];

  // Example data for rows
  final List<Map<String, dynamic>> rowData = [
    {
      'ID': '1',
      'Name': 'Alice',
      'Age': '25',
      'ID1': '1',
      'Name1': 'Alice',
      'Age1': '25',
      'ID2': '1',
      'Name2': 'Alice',
      'Age2': '25'
    },
    {
      'ID': '1',
      'Name': 'Alice',
      'Age': '25',
      'ID1': '1',
      'Name1': 'Alice',
      'Age1': '25',
      'ID2': '1',
      'Name2': 'Alice',
      'Age2': '25'
    },
    {
      'ID': '1',
      'Name': 'Alice',
      'Age': '25',
      'ID1': '1',
      'Name1': 'Alice',
      'Age1': '25',
      'ID2': '1',
      'Name2': 'Alice',
      'Age2': '25'
    },
    {
      'ID': '1',
      'Name': 'Alice',
      'Age': '25',
      'ID1': '1',
      'Name1': 'Alice',
      'Age1': '25',
      'ID2': '1',
      'Name2': 'Alice',
      'Age2': '25'
    },
    {
      'ID': '1',
      'Name': 'Alice',
      'Age': '25',
      'ID1': '1',
      'Name1': 'Alice',
      'Age1': '25',
      'ID2': '1',
      'Name2': 'Alice',
      'Age2': '25'
    },
    {
      'ID': '1',
      'Name': 'Alice',
      'Age': '25',
      'ID1': '1',
      'Name1': 'Alice',
      'Age1': '25',
      'ID2': '1',
      'Name2': 'Alice',
      'Age2': '25'
    },
    {
      'ID': '1',
      'Name': 'Alice',
      'Age': '25',
      'ID1': '1',
      'Name1': 'Alice',
      'Age1': '25',
      'ID2': '1',
      'Name2': 'Alice',
      'Age2': '25'
    },
    {
      'ID': '1',
      'Name': 'Alice',
      'Age': '25',
      'ID1': '1',
      'Name1': 'Alice',
      'Age1': '25',
      'ID2': '1',
      'Name2': 'Alice',
      'Age2': '25'
    },
  ];

  @override
  Widget build(BuildContext context) {
    void updateYear(String? newValue) {
      setState(() {
        year = newValue;
      });
    }

    void updateSemesterType(String? newValue) {
      setState(() {
        semesterType = newValue;
      });
    }

    void updateSemester(String? newValue) {
      setState(() {
        semester = newValue;
      });
    }

    void updateDepartment(String? newValue) {
      setState(() {
        department = newValue;
      });
    }

    void updateSection(String? newValue) {
      setState(() {
        department = newValue;
      });
    }

    void updateSubjectCode(String? newValue) {
      setState(() {
        department = newValue;
      });
    }

    void updateSession(String? newValue) {
      setState(() {
        department = newValue;
      });
    }

    void updateSortBy(String? newValue) {
      setState(() {
        department = newValue;
      });
    }

    void onChanged(String? newValue) {
      setState(() {
        date = newValue;
      });
    }

    Future<void> exportToExcel() async {
      var excel = Excel.createExcel();
      Sheet sheetObject = excel['Sheet1'];

      // Add column headers to the first row
      sheetObject.appendRow(columnHeaders);

      // Add row data
      rowData.forEach((row) {
        List<String> rowContent =
            columnHeaders.map((header) => row[header].toString()).toList();
        sheetObject.appendRow(rowContent);
      });

      // Save the file to the device
      final Directory? appDocumentsDirectory =
          await getExternalStorageDirectory();
      final String filePath =
          '${appDocumentsDirectory!.path}/attendance_report.xlsx';
      // print(excel.encode());
      await File(filePath).writeAsBytes(excel.encode()!);
      Share.shareFiles([filePath], text: 'Here is the attendance report.');

      print('Excel file saved to: $filePath');
    }

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 233, 233),
      appBar: AppBarWidget(context, true, "Generate Report"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Card(
          margin: EdgeInsets.all(20),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(height: 20),
                Text("Generate Report",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 20),
                DateMenu(labelName: "From", onChanged: onChanged),
                SizedBox(height: 20),
                DateMenu(labelName: "To", onChanged: onChanged),
                SizedBox(height: 20),
                DropdownMenu_(
                    labelName: "Year",
                    hint: "Select Year",
                    onChanged: updateYear,
                    searchKey: "",
                    width: screenWidth,
                    items: ["1st", "2nd", "3rd", "4th"]),
                SizedBox(height: 20),
                DropdownMenu_(
                    labelName: "Semester Type",
                    hint: "Select Semester Type",
                    onChanged: updateSemesterType,
                    searchKey: "",
                    width: screenWidth,
                    items: ["Odd", "Even"]),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                DropdownMenu_(
                    labelName: "Department",
                    hint: "Select Department",
                    onChanged: updateDepartment,
                    searchKey: "",
                    width: screenWidth,
                    items: ["CSE", "EEE", "BBA", "LLB", "ENG", "PHARMACY"]),
                SizedBox(height: 20),
                DropdownMenu_(
                    labelName: "Section",
                    hint: "Select Section",
                    onChanged: updateSection,
                    searchKey: "",
                    width: screenWidth,
                    items: ["NA", "A", "B", "C"]),
                SizedBox(height: 20),
                DropdownMenu_(
                    labelName: "Subject Code",
                    hint: "Select Subject Code",
                    onChanged: updateSubjectCode,
                    searchKey: "",
                    width: screenWidth,
                    items: ["CSE101", "CSE102", "CSE103", "CSE104"]),
                SizedBox(height: 20),
                DropdownMenu_(
                    labelName: "Session",
                    hint: "Select Session",
                    onChanged: updateSession,
                    searchKey: "",
                    width: screenWidth,
                    items: ["2024-25", "2025-26", "2026-27", "2027-28"]),
                SizedBox(height: 20),
                DropdownMenu_(
                    labelName: "Sort By",
                    hint: "Select Sort By",
                    onChanged: updateSortBy,
                    searchKey: "",
                    width: screenWidth,
                    items: ["Date", "Department"]),
                SizedBox(height: 20),
                Text(
                  "Result",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 15),
                DataTable_(
                  columnHeaders: columnHeaders,
                  rowData: rowData,
                ),
                SizedBox(height: 30),
                RoundedButton(
                    btnName: "Export to .xlsx",
                    callback: () {
                      exportToExcel();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
