import 'package:flutter/material.dart';

class ClassroomOption extends StatelessWidget {
  final dynamic data;
  const ClassroomOption({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, left: 15.0, right: 15.0, bottom: 10.0),
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            const Color.fromARGB(255, 226, 226, 226),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['Subject_Code'],
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                data['Subject_Name'],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 114, 114, 114),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Tag(data['Year'].toString()),
                    SizedBox(
                      width: 5.0,
                    ),
                    Tag(data['Semester_Type']),
                    SizedBox(
                      width: 5.0,
                    ),
                    Tag(data['Department']),
                    SizedBox(
                      width: 5.0,
                    ),
                    Tag(data['Class_Type']),
                    SizedBox(
                      width: 5.0,
                    ),
                    Tag(data['Session']),
                    SizedBox(
                      width: 30.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          // Navigator.pushNamed(context, '/faculty/classroom/subject',
          //     arguments: data);
        },
      ),
    );
  }

  Container Tag(String str) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
        child: Text(str,
            style: TextStyle(
              fontSize: 12,
              color: const Color.fromARGB(255, 114, 114, 114),
            )),
      ),
    );
  }
}
