import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowDetailMovieComponent extends StatelessWidget {
  final String moviesText;
  const RowDetailMovieComponent({super.key,required this.moviesText});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            moviesText,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 0.15,
            ),
          ),
          InkWell(
            onTap: () {
              /// TODO : NAVIGATION TO POPULAR SCREEN
            },
            child:const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                children:  [
                  Text('See More',style: TextStyle( color: Colors.white,),),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
