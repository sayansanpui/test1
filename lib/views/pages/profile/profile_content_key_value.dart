// import 'dart:math';

import 'package:flutter/material.dart';

class ProfileContentKeyValue extends StatelessWidget {
  const ProfileContentKeyValue({
    super.key,
    required this.screenWidth,
    required this.keyname,
    required this.valuename,
  });

  final double screenWidth;
  final String keyname;
  final String valuename;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(top: 15.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          children: [
            Text(
              keyname,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Text(valuename,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
