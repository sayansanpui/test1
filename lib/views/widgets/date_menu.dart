import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateMenu extends StatefulWidget {
  final String labelName;
  final String? hint;
  final double? width;
  final ValueChanged<String?> onChanged;

  DateMenu({
    super.key,
    required this.labelName,
    this.hint,
    this.width,
    required this.onChanged,
  });

  @override
  _DateMenuState createState() => _DateMenuState();
}

class _DateMenuState extends State<DateMenu> {
  TextEditingController _dateController = TextEditingController();
  DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: widget.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  hintText: widget.hint ?? "Enter date (dd-mm-yyyy)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Colors.black, // header background color
                            onPrimary: Colors.white, // header text color
                            onSurface: Colors.black, // body text color
                          ),
                          dialogBackgroundColor:
                              Colors.white, // background color
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDate != null) {
                    String formattedDate = _dateFormat.format(pickedDate);
                    setState(() {
                      _dateController.text = formattedDate;
                    });
                    widget.onChanged(formattedDate);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
