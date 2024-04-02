import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bmi/utils/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../model/age_weight_widget.dart';
import '../model/gender_widget.dart';
import '../model/height_widget.dart';
import 'ScoreScreen.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key:key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

@override
  Widget build(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.titleTextColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)
            )),
        centerTitle: true,
        title: const Text("Get Your BMI Value"),
  ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.white,
         child: Card(
           elevation: 12,
           color: Colors.white,
           shape: RoundedRectangleBorder(
             side: const BorderSide(
               color: MyColors.btnBorderColor,
             ),
            borderRadius: BorderRadius.circular(15.0),),
            child: Column(
               children: [
                 SizedBox(height: mediaQuery.size.height * 0.03,),
             GenderWidget(onChange: (genderVal){
              _gender = genderVal;
            },),
                 SizedBox(height: mediaQuery.size.height * 0.03,),
                 HeightWidget(onChange:(heightVal){
               _height = heightVal;
             },),
                 SizedBox(height: mediaQuery.size.height * 0.03,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     AgeWeightWidget(
                         onChange: (ageVal) {
                           _age = ageVal;
                         },
                         title: "Age (years)",
                         initValue: 30,
                         min: 20,
                         max: 100),
                     AgeWeightWidget(
                         onChange: (weightVal) {
                           _weight = weightVal;
                         },
                         title: "Weight(kg)",
                         initValue: 50,
                         min: 0,
                         max: 200)
                   ],
                 ),
                 SizedBox(height: mediaQuery.size.height * 0.03,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 60),
                  child: SwipeableButtonView(
                      isFinished: _isFinished,
                      onFinish: () async {
                        await Navigator.push(
                            context,
                            PageTransition(
                                child: ScoreScreen(
                                  bmiScore: _bmiScore,
                                  age: _age,
                                ),
                                type: PageTransitionType.fade));

                        setState(() {
                          _isFinished = false;
                        });
                      },
                      onWaitingProcess: () {
                        //Calculate BMI here
                        calculateBmi();

                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            _isFinished = true;
                          });
                        });
                      },
                      activeColor: MyColors.titleTextColor,
                      buttonWidget: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: MyColors.btnBorderColor,
                      ),
                      buttonText: "GET VALUE"),
                ),
                 SizedBox(height: mediaQuery.size.height * 0.04,),],

          ),
  ),
  ),
      ),
  );
  }
  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);

  }
}