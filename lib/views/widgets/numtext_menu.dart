import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NumTextMenu extends StatefulWidget {
  final String labelName;
  final String? hint;
  final String? api;
  final double? width;
  final ValueChanged<String?> onChanged;

  const NumTextMenu({
    Key? key,
    required this.labelName,
    this.hint = "Enter total number of students",
    this.api,
    this.width = 300,
    required this.onChanged,
  }) : super(key: key);

  @override
  _NumTextMenuState createState() => _NumTextMenuState();
}

class _NumTextMenuState extends State<NumTextMenu> {
  String inputTotalStudents = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.api != null) {
      fetchData();
    }
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(widget.api!));

      if (response.statusCode == 200) {
        // Assuming the API returns a single value for the number of students
        String data = jsonDecode(response.body);
        setState(() {
          inputTotalStudents = data;
          _isLoading = false;
        });
        widget.onChanged(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15,
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  width: widget.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 10),
                    child: TextField(
                      onChanged: (String value) {
                        if (int.tryParse(value) != null) {
                          setState(() {
                            inputTotalStudents = value;
                          });
                          widget.onChanged(value);
                        }
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: const Color.fromARGB(255, 0, 0, 0),
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
