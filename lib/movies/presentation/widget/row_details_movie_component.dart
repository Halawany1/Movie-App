import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildRowDetailsMovie extends StatelessWidget {
  final dynamic text;
  final bool vote;
  final IconData icon;

  const BuildRowDetailsMovie(
      {super.key, required this.text,
        required this.icon,
        required this.vote});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: vote ? Colors.white : Color(0xFFFF8700),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text.toString(),
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: vote ? Colors.white : Color(0xFFFF8700),
          ),
        ),
      ],
    );
  }
}
