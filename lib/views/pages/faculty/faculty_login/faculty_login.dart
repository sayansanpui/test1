import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';

class FacultyLogin extends StatelessWidget {
  const FacultyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      /////////////////////////////////////////////////////////////////////////////////
      appBar: AppBarWidget(context, false, "Faculty Login"),
      // appBar: AppBar(
      //   toolbarHeight: 80.0,
      //   title: const Padding(
      //     padding: EdgeInsets.only(left: 15.0),
      //     child: Text("Attendance Management",
      //         style: TextStyle(color: Colors.black)),
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      /////////////////////////////////////////////////////////////////////////////////
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Faculty Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email or Phone no.",
                        hintText: "Enter your college mail",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      /////////////////////////////////////////////////////////////////////////////////
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, "/faculty/otp");
        },
        child: Icon(Icons.send, color: Colors.white),
        // mini: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
