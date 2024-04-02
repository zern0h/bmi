import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';
import '../utils/colors.dart';
import 'HistoryScreen.dart';
import '../model/pdfviewer.dart';
import '../model/bmi_operations.dart';

class ScoreScreen extends StatefulWidget {
  final double bmiScore;
  final int age;

  const ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

  @override
  void initState() {
    super.initState();
    setBmiInterpretation();
    saveBMIRecord(widget.bmiScore, bmiStatus!); // Save BMI record when the screen is initialized
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Value"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history), // Icon for viewing history
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HistoryScreen(),
                ),
              );
            },
          ),
        ],
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
                style: TextStyle(
                    fontSize: 30,
                    color: MyColors.titleTextColor,
                    fontWeight: FontWeight.w500),
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
                  widget.bmiScore.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 40, color: MyColors.titleTextColor),
                ),
                currentValue: widget.bmiScore.toDouble(),
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
                style: const TextStyle(
                  fontSize: 18,
                ),
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
                      backgroundColor:
                      MyColors.titleTextColor, // Background color
                    ),
                    child: const Text(
                      "Re-calculate",
                      style: TextStyle(
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Share.share(
                          "My BMI value is ${widget.bmiScore.toStringAsFixed(
                              2)}, check yours now");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      MyColors.titleTextColor, // Background color
                    ),
                    child: const Text(
                      "Share",
                      style: TextStyle(
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PdfViewerScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  MyColors.titleTextColor, // Background color
                ),
                child: const Text(
                  "Read More About BMI",
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (widget.bmiScore >= 40) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity.";
      bmiStatusColor = Colors.orangeAccent;
    } else if (widget.bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Keep up with your workouts \n& aim to shed a few pounds.";
      bmiStatusColor = Colors.orange;
    } else if (widget.bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Looking good! Your fitness \ngame is on point.";
      bmiStatusColor = Colors.green;
    } else if (widget.bmiScore <= 18.4) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Time to bulk up a bit!";
      bmiStatusColor = Colors.redAccent;
    }
  }
}


