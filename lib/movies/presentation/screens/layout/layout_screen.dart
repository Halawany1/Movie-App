import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wather_app/core/constant.dart';
import 'package:wather_app/core/utils/app_name.dart';
import 'package:wather_app/movies/presentation/controller/movie_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit,MovieState>(
      builder: (context, state) {
        var cubit=context.read<MovieCubit>();
        return Scaffold(
          body: cubit.screens[cubit.indexNavbar],
          bottomNavigationBar: SizedBox(
            height: 60,
            //color:Color(0xFF0296E5)
            child: Stack(
              children: [
                 BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: color,
                  onTap: (value) {
                    cubit.changeIndexNavBar(value);
                  },
                  currentIndex: cubit.indexNavbar,
                  selectedItemColor:const Color(0xFF0296E5),
                  unselectedItemColor: const Color(0xFF67686D),
                  items: [
                    BottomNavigationBarItem(icon: const Icon(Icons.home,size: 30,),label: AppName.home),
                    BottomNavigationBarItem(icon: const Icon(Icons.search,size: 30),label: AppName.search),
                    BottomNavigationBarItem(icon: const Icon(Icons.bookmark_border,size: 30),label:AppName.watchList),
                  ],

                ),
                Container(width: double.infinity,height: 1.5,color:const Color(0xFF0296E5))
              ],
            ),
          ),
        );
      },
      listener: (context, state) {

      },
    );
  }
}