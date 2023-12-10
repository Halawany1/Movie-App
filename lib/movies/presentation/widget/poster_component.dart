import 'package:flutter/cupertino.dart';
import 'package:wather_app/core/network/api_constance.dart';

class BuildPoster extends StatelessWidget {
  final String poster;
  final int ?index;
  final double height;
  final bool item;

  const BuildPoster(
      {super.key, required this.height,
        required this.index,
        required this.poster
        , required this.item});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(item ? 25 : 15),
            child: Image.network(
                fit: BoxFit.cover,
                height: 210,
                width: 145,
                ApiConstance.imageUrl(poster)),
          ),
          !item
              ? Positioned(
            top: 165,
            left: 0,
            child: Image.asset('assets/images/${index! + 1}.png'),
          )
              : Container()
        ],
      ),
    );
  }
}

