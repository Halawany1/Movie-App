import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildBoxAuthentication extends StatelessWidget {
  final String image;
  final String text;

  const BuildBoxAuthentication(
      {super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 78,
      height: 78,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color:const Color(0xFF0D151F)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$image',
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: GoogleFonts.roboto(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    );
  }
}
