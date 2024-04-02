import 'package:flutter/material.dart';
import 'package:bmi/view/Onboarding.dart';
import 'package:bmi/utils/colors.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'model/bmi_record.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path); // Initialize Hive with the app directory path
  Hive.registerAdapter(BMIRecordAdapter()); // Register adapter
  await Hive.openBox<BMIRecord>('bmi_records'); // Open the Hive box
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
            displayLarge: TextStyle(
              fontSize: 25,
              color: MyColors.titleTextColor,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: TextStyle(
                fontSize: 18,
                color: MyColors.subTitleTextColor,
                fontWeight: FontWeight.w400,
                wordSpacing: 1.2,
                height: 1.3),
            displaySmall: TextStyle(
              fontSize: 23,
              color: MyColors.titleTextColor,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: TextStyle(
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