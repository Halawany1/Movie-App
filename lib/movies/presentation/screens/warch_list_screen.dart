import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wather_app/movies/presentation/controller/movie_cubit.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit,MovieState>(
      builder: (context, state) {
        var cubit=context.read<MovieCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  cubit.changeIndexNavBar(1);
                },
                child:const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              'Watch list',
              style: GoogleFonts.montserrat(fontSize: 20),
            ),
          ),
          body:  Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/watchlist.png',width: 100,height: 100,),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    'There is no movie yet!',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Find your movie by Type title,\n\t\t\t\t\t\t\t\t\tcategories, years, etc',
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color:const  Color(0xFF92929D),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {

      },
    );
  }
}