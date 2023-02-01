import 'package:flutter/material.dart';
import 'package:bmi/view/onboarding.dart';
import 'package:bmi/utils/colors.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 25,
              color: MyColors.titleTextColor,
              fontWeight: FontWeight.bold,
            ),
            headline2: TextStyle(
                fontSize: 18,
                color: MyColors.subTitleTextColor,
                fontWeight: FontWeight.w400,
                wordSpacing: 1.2,
                height: 1.3),
            headline3: TextStyle(
              fontSize: 23,
              color: MyColors.titleTextColor,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: MyColors.titleTextColor,
          foregroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle( //<-- SEE HERE
            // Status bar color
            statusBarColor: MyColors.titleTextColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}