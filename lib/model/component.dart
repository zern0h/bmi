import 'package:flutter/material.dart';
import 'package:bmi/utils/colors.dart';

import '../view/HomeScreen.dart';

class GetStartBtn extends StatelessWidget {
  const GetStartBtn({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())
      );},
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        width: size.width / 1.5,
        height: size.height / 13,
        decoration: BoxDecoration(
            color: MyColors.titleTextColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text("GET STARTED", style: textTheme.headlineMedium),
        ),
      ),
    );
  }
}

class SkipBtn extends StatelessWidget {
  const SkipBtn({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      width: size.width / 1.5,
      height: size.height / 13,
      decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.btnBorderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: onTap,
        splashColor: MyColors.btnBorderColor,
        child: Center(
          child: Text("SKIP", style: textTheme.displaySmall),
        ),
      ),
    );
  }
}