import 'package:flutter/material.dart';
import 'package:my_app/views/widgets/appbar_section.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      /////////////////////////////////////////////////////////////////////////////////
      appBar: AppBarWidget(context, false, "OTP Verification"),
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
                    "OTP Verification",
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
                        labelText: "Enter OTP",
                        hintText: "Enter OTP in your college mail",
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
          Navigator.pushNamed(context, "/faculty/home");
        },
        child: Icon(Icons.send, color: Colors.white),
        // mini: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
