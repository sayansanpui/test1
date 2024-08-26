import 'package:flutter/material.dart';
import 'package:my_app/views/pages/profile/profile_content_key_value.dart';
import 'package:my_app/views/widgets/appbar_section.dart';
import 'package:my_app/views/widgets/rounded_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(context, true, false),
      body: Container(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            ProfileContentKeyValue(
                screenWidth: screenWidth,
                keyname: "Name:",
                valuename: "John Doe"),
            ProfileContentKeyValue(
                screenWidth: screenWidth,
                keyname: "Phone:",
                valuename: "+91 9876543210"),
            ProfileContentKeyValue(
                screenWidth: screenWidth,
                keyname: "Department:",
                valuename: "IT"),
            ProfileContentKeyValue(
                screenWidth: screenWidth, keyname: "Post:", valuename: "HOD"),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: RoundedButton(
                  btnName: "Logout",
                  callback: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
