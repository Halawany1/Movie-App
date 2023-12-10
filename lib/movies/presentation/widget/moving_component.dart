import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wather_app/movies/presentation/controller/movie_cubit.dart';
import 'package:wather_app/movies/presentation/widget/under_line_on_and_off_component.dart';

class  BuildMoving extends StatelessWidget {
  final MovieCubit cubit;
  final String text;
  final int index;
  const BuildMoving({super.key,
    required this.text,
    required this.index,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.changeIndex(index);
      },
      child: Column(
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
          ),
          const SizedBox(
            height: 12,
          ),
          cubit.index == index ? const BuildUnderLineOn() :const BuildUnderLineOff()
        ],
      ),
    );
  }
}
