import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  final String btnName;
  final Image? btnIcon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final VoidCallback? callback;
  final double? padding;
  final double? gap;

  const BorderButton(
      {super.key,
      required this.btnName,
      this.btnIcon,
      this.bgColor = Colors.white,
      this.textStyle = const TextStyle(
          color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
      this.borderRadius = 10.0,
      required this.callback,
      this.padding = 0,
      this.gap = 20.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          callback!();
        },
        style: ElevatedButton.styleFrom(
          // Background color
          backgroundColor: bgColor,
          textStyle: textStyle, // Text style
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius!), // Rounded corners
            side: BorderSide(color: Colors.black), // Black border
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding!),
          child: btnIcon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    btnIcon!,
                    SizedBox(width: gap), // Space between icon and text
                    Text(
                      btnName,
                      style: textStyle,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      btnName,
                      style: textStyle,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
