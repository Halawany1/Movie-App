import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wather_app/core/constant.dart';
import 'package:wather_app/core/utils/app_name.dart';
import 'package:wather_app/movies/presentation/controller/movie_cubit.dart';
import 'package:wather_app/movies/presentation/screens/layout/layout_screen.dart';
import 'package:wather_app/movies/presentation/widget/box_authentication_component.dart';
import 'package:wather_app/movies/presentation/widget/default_button_component.dart';
import 'package:wather_app/movies/presentation/widget/text_form_field_component.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    List text = [
      AppName.welcome,
      AppName.welcomeBack,
    ];
    return BlocConsumer<MovieCubit, MovieState>(
      builder: (context, state) {
        var cubit = context.read<MovieCubit>();
        return Scaffold(
          backgroundColor: color,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 58.0, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      text[cubit.index],
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                   const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            cubit.changeIndex(0);
                          },
                          child: buildColumn(text: AppName.signUp,
                              color: cubit.index == 0 ? true : false),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            cubit.changeIndex(1);
                          },
                          child: buildColumn(text: AppName.login,
                              color: cubit.index == 1 ? true : false),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if(cubit.index == 0)
                      Column(
                        children: [
                          Text(
                            AppName.registerAccount,
                            style:
                            GoogleFonts.poppins(fontSize: 16, color: Colors
                                .white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BuildTextFormField(
                            text: AppName.emailAddress, pass: false, cubit: cubit,
                            validate: (String? value) {
                              return null;
                            },),
                          const  SizedBox(
                            height: 20,
                          ),
                          BuildTextFormField(
                              validate: (String? value) {
                                return null;
                              },
                              text: AppName.password, pass: true, cubit: cubit),
                          const SizedBox(
                            height: 20,
                          ),
                          BuildTextFormField(
                              validate: (String? value) {
                                return null;
                              },
                              text: AppName.confirmPassword,
                              pass: true,
                              cubit: cubit),
                          const SizedBox(
                            height: 30,
                          ),
                          BuildDefaultButton(
                            text: AppName.signUp,
                            width: double.infinity,
                            height: 52,
                            bkcolor: const Color(0xFF0296E5).withOpacity(0.8),
                            border: false,
                            onPress: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return const  LayoutScreen();
                                  },));
                            },),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(children: [
                            Container(width: 110,
                              color: Colors.white,
                              height: 1,),
                            const SizedBox(width: 15,),
                            Text(AppName.orSignUpWith, style: GoogleFonts.roboto(
                                fontSize: 16, color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),),
                            const SizedBox(width: 15,),
                            Container(width: 110,
                              height: 1,
                              color: Colors.white,),
                          ],),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BuildBoxAuthentication(
                                  image: AppName.googleImage, text: AppName.google),
                              const SizedBox(width: 30,),
                              BuildBoxAuthentication(
                                  image: AppName.appleImage, text: AppName.apple),
                              const SizedBox(width: 30,),
                              BuildBoxAuthentication(
                                  image: AppName.faceBookImage, text: AppName.facebook),
                            ],
                          ),
                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppName.alreadyHaveAnAccount,
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.white
                                ),),
                              const SizedBox(width: 5,),
                              Text(AppName.login, style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16, color: Colors.white
                              ),),
                            ],
                          )
                        ],
                      )

                    else
                      if(cubit.index == 1)
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Text(
                                AppName.loginAccount,
                                style:
                                GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              BuildTextFormField(
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return "Email Address must be found";
                                    }
                                    return null;
                                  },
                                  text: AppName.emailAddress,
                                  pass: false,
                                  cubit: cubit),
                              const SizedBox(
                                height: 20,
                              ),
                              BuildTextFormField(
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return "Password must be found";
                                    }
                                    return null;
                                  },
                                  text: AppName.password, pass: true, cubit: cubit),
                              const SizedBox(
                                height: 30,
                              ),
                              BuildDefaultButton(
                                text: AppName.login,
                                width: double.infinity,
                                height: 52,
                                bkcolor:const Color(0xFF0296E5).withOpacity(0.8),
                                border: false,
                                onPress: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return const LayoutScreen();
                                      },));
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(AppName.forgotPassword,
                                    style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(children: [
                                Container(width: 115,
                                  color: Colors.white,
                                  height: 1,),
                                const SizedBox(width: 15,),
                                Text(AppName.orLoginWith, style: GoogleFonts.roboto(
                                    fontSize: 16, color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),),
                                const SizedBox(width: 15,),
                                Container(width: 115,
                                  height: 1,
                                  color: Colors.white,),
                              ],),
                              const SizedBox(
                                height: 50,
                              ),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BuildBoxAuthentication(
                                      image: AppName.googleImage, text: AppName.google),
                                  const SizedBox(width: 30,),
                                  BuildBoxAuthentication(
                                      image: AppName.appleImage, text: AppName.apple),
                                  const SizedBox(width: 30,),
                                  BuildBoxAuthentication(
                                      image: AppName.faceBookImage, text: AppName.facebook),
                                ],
                              ),
                              const SizedBox(height: 35),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(AppName.notHaveAnAccount,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: Colors.white
                                    ),),
                                  const SizedBox(width: 5,),
                                  Text(AppName.createAccount,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16, color: Colors.white
                                    ),),
                                ],
                              )
                            ],
                          ),
                        )

                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {

      },
    );
  }

  Column buildColumn({required String text, required bool color}) {
    return Column(
      children: [
        Text(text,
            style: GoogleFonts.poppins(
                fontWeight: color ? FontWeight.bold : null,
                fontSize: 24,
                color: Colors.white)),
        if (color)
          Container(
            width: 88,
            height: 2.5,
            color: Colors.white,
          )
      ],
    );
  }
}