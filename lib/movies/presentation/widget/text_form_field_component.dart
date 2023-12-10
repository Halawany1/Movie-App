import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wather_app/movies/presentation/controller/movie_cubit.dart';

class BuildTextFormField extends StatelessWidget {
  final String text;
  final String? Function(String?)? validate;
  final bool pass;
  final MovieCubit cubit;

  const BuildTextFormField({
    super.key,
    required this.text,
    required this.cubit,
    required this.validate,
    required this.pass,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      style:const TextStyle(color: Colors.white),
      obscureText: pass ? !cubit.visability : false,
      decoration: InputDecoration(
          hintText: text,
          suffixIcon: pass
              ? GestureDetector(
                  onTap: () {
                    cubit.changeVisabilityIcon();
                  },
                  child: Icon(
                    cubit.visability
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: Colors.white,
                    size: 20,
                  ))
              : null,
          hintStyle: GoogleFonts.poppins(color: Colors.white),
          enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          disabledBorder:const  OutlineInputBorder()),
    );
  }
}
