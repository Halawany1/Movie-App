import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildDefaultButton extends StatelessWidget {
  final String text;
  final Color bkcolor;
  final double width;
  final double height;
  final void Function() onPress;
  final bool border;

  const BuildDefaultButton(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.bkcolor,
      required this.border,
      required this.onPress,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            side:
                border ?const BorderSide(color: Colors.white, strokeAlign: 5) : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: bkcolor,
            minimumSize: Size(width, height),
            maximumSize: Size(width, height)),
        child: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
        ));
  }
}
