import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/colors.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;

  final int age;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Value"),
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Your Body Mass Index",
                      style: TextStyle(fontSize: 30, color: MyColors.titleTextColor,fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 50,
                      segments: [
                        GaugeSegment('UnderWeight', 18.4, Colors.orangeAccent),
                        GaugeSegment('Normal', 6.5, Colors.green),
                        GaugeSegment('OverWeight', 15, Colors.orange),
                        GaugeSegment('Obese', 10.1, Colors.redAccent),
                      ],
                      valueWidget: Text(
                        bmiScore.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 40, color: MyColors.titleTextColor ),
                      ),
                      currentValue: bmiScore.toDouble(),
                      needleColor: MyColors.titleTextColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiStatus!,
                      style: TextStyle(fontSize: 23, color: bmiStatusColor!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiInterpretation!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18,),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.titleTextColor, // Background color
                            ),
                            child: const Text("Re-calculate")),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Share.share(
                                  "My BMI value is ${bmiScore.toStringAsFixed(1)}, check yours now");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.titleTextColor, // Background color
                            ),
                            child: const Text("Share")),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.titleTextColor, // Background color
                        ),
                        child: const Text("Read More About BMI")),

                  ]))),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore >=40) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity.";
      bmiStatusColor = Colors.orangeAccent;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & try \nto drop some weight.";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, you are fit.";
      bmiStatusColor = Colors.green;
    } else if (bmiScore <= 18.4) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to gain some weight.";
      bmiStatusColor = Colors.redAccent;
    }
  }
}