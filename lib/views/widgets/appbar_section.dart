import 'package:flutter/material.dart';
// import 'package:my_app/views/pages/profile/profile.dart';

AppBar AppBarWidget(
  BuildContext context,
  bool isProfileButtonVisible,
  String heading,
) {
  return AppBar(
    toolbarHeight: 80.0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(0.0),
      child: Container(
        color: Colors.grey[200],
        height: 2.0,
      ),
    ),
    title: Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0), // Adjust padding as needed
            child: Text(
              heading,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    ),
    actions: [
      if (isProfileButtonVisible)
        TextButton(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Color.fromARGB(255, 226, 226, 226),
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 30.0,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/profile");
          },
        ),
    ],
  );
}