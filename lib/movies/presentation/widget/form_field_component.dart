import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildFormField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String?) onSubmit;
  const BuildFormField({super.key,
    required this.controller,
    required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onSubmit,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: 'Search',
            contentPadding: const EdgeInsets.only(left: 25, top: 4),
            suffixIconConstraints: const BoxConstraints(maxHeight: 30, minWidth: 60),
            hintStyle: GoogleFonts.montserrat(
              color: Colors.grey,
            ),
            suffixIconColor: Colors.grey,
            filled: true,
            fillColor: const Color(0xFF3A3F47),
            suffixIcon: const Icon(
              CupertinoIcons.search,
              size: 27,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
