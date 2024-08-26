import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TextMenu extends StatefulWidget {
  final String labelName;
  final String? hint;
  final String? api;
  final double? width;
  final double? height;
  final ValueChanged<String?> onChanged;

  const TextMenu({
    Key? key,
    required this.labelName,
    required this.hint,
    this.api,
    this.width = 500,
    this.height = 55, // Default height value
    // required this.height, // Default height value is 55
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextMenuState createState() => _TextMenuState();
}

class _TextMenuState extends State<TextMenu> {
  String inputText = '';
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
        // Assuming the API returns a single value for the text
        String data = jsonDecode(response.body);
        setState(() {
          inputText = data;
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  width: widget.width,
                  height: widget.height, // Use the height parameter
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
                        setState(() {
                          inputText = value;
                        });
                        widget.onChanged(value);
                      },
                      keyboardType: TextInputType.text,
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
