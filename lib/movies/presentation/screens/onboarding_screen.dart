import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wather_app/movies/presentation/screens/authentication_screen.dart';
import 'package:wather_app/movies/presentation/widget/default_button_component.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onboarding.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            left: 20,
            bottom: 310,
            child: Text('Downloads',
                style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ),
          Positioned(
            left: 20,
            bottom: 250,
            child: Text(
                'Download movies and watch them offline\n'
                    'at your own convenience',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
          ),
          Positioned(
              left: 20,
              bottom: 60,
              child: BuildDefaultButton(text: 'Signup',
                  onPress: () {
                    Navigator
                        .pushReplacement(context, MaterialPageRoute(builder: (context)
                    =>
                    const  AuthenticationScreen())
                    );
                  },
                  border: true,
                  width: 167,
                  height: 49,
                  bkcolor: Colors.transparent,
                 )
          ),
          Positioned(
              right: 20,
              bottom: 60,
              child: BuildDefaultButton(
                border: false,
                text: 'Login',
                  width: 167, height: 50,
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) =>const AuthenticationScreen(),));
              }, bkcolor: Colors.blue,
              )
          ),
        ],
      ),
    );
  }
}