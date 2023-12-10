import 'package:flutter/cupertino.dart';

class BuildUnderLineOn extends StatelessWidget {
  const BuildUnderLineOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 4,
      color:  const Color(0xFF3A3F47),
    );
  }
}

class BuildUnderLineOff extends StatelessWidget {
  const BuildUnderLineOff({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 90, height: 4);
  }
}
