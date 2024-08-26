import 'package:flutter/material.dart';
import 'package:my_app/views/pages/profile/profile.dart';

AppBar AppBarWidget(
  BuildContext context,
  bool isBackButtonVisible,
  bool isProfileButtonVisible,
) {
  return AppBar(
    toolbarHeight: 80.0,
    automaticallyImplyLeading: false, // Disable the automatic back button
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
        isBackButtonVisible == true
            ? TextButton(
                child: Container(
                  width: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back_ios, color: Colors.black),
                      Text("Back",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : Container(),
        Spacer(), // This will push the profile button to the right
      ],
    ),
    actions: [
      isProfileButtonVisible == true
          ? TextButton(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 16.0), // Adjust the padding as needed
                child: CircleAvatar(
                  radius: 22.0, // Adjust the radius as needed
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/profile");
              },
            )
          : Container(),
    ],
  );
}
