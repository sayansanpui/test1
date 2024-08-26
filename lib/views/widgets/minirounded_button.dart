import 'package:flutter/material.dart';

class MiniroundedButton extends StatelessWidget {
  final String btnName;
  final Icon? btnIcon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final VoidCallback? callback;
  final double? padding;
  final double? gap;
  final double? width;

  const MiniroundedButton({
    super.key,
    required this.btnName,
    required this.width,
    this.btnIcon,
    this.bgColor = Colors.black,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 18),
    this.borderRadius = 10.0,
    required this.callback,
    this.padding = 8.0,
    this.gap = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45, // Set the button height
      width: width, // Set the button width dynamically
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
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding!),
          child: btnIcon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
