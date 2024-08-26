import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/views/pages/faculty/faculty_classroom/classroom_option.dart';
import 'package:my_app/views/widgets/appbar_section.dart';

class FacultyClassroom extends StatefulWidget {
  final String api =
      "https://attendence-rho-eight.vercel.app/portal/classroom/id";
  final String inputTeacherRegistrationId =
      "f5c8e90b-d865-43ac-b841-36f644f08a1d";
  const FacultyClassroom({super.key});

  @override
  State<FacultyClassroom> createState() => _FacultyClassroomState();
}

class _FacultyClassroomState extends State<FacultyClassroom> {
  List<dynamic> myArray = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var headers = {'Content-Type': 'application/json'};
    String jsonData = jsonEncode(
        {"Teacher_Registraion_Id": widget.inputTeacherRegistrationId});
    print(jsonData);
    try {
      final response = await http.post(Uri.parse(widget.api),
          headers: headers, body: jsonData);

      if (response.statusCode == 201) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          // myArray = data;
          myArray.addAll(data);

          // myArray.addAll(data);
          // myArray.addAll(data);
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // print(e);
    } finally {
      // Ensure _isLoading is set to false in both success and error scenarios
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(context, true, true),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: myArray.isEmpty
                  ? [
                      Container(
                        height: screenHeight - 200,
                        child: Center(
                          child: Image.asset('assets/nothing_found.png',
                              width: 200, height: 200),
                        ),
                      )
                    ] as List<Widget>
                  : myArray.map((item) => ClassroomOption(data: item)).toList(),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          // Add your button's onPressed logic here
          Navigator.pushNamed(context, "/create/classroom");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          weight: 500,
          size: 30,
        ),
      ),
    );
  }
}
