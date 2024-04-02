import 'package:flutter/material.dart';
import 'package:bmi/model/bmi_record.dart';
import 'package:intl/intl.dart';
import '../model/bmi_operations.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History'),
      ),
      body: FutureBuilder<List<BMIRecord>>(
        future: _getBMIRecords(),
        builder: (BuildContext context, AsyncSnapshot<List<BMIRecord>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.black),
                ),
              );
            } else {
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    'No BMI records found',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              } else {

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  reverse: true,
                  shrinkWrap: true,
                  
                  itemBuilder: (BuildContext context, int index) {
                    BMIRecord record = snapshot.data![index];
                    Color? avatarColor;
                    if (record.bmiStatus == "Obese") {
                      avatarColor = Colors.orangeAccent;
                    } else if (record.bmiStatus == "Overweight") {
                      avatarColor = Colors.orange;
                    } else if (record.bmiStatus == "Normal") {
                      avatarColor = Colors.green;
                    } else if (record.bmiStatus == "Underweight") {
                      avatarColor = Colors.redAccent;
                    }
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: avatarColor ?? Colors.grey, // Use dynamic color or default to grey
                      ),

                      title: Text(
                        "BMI Score: ${record.bmiScore.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        "Status: ${record.bmiStatus}  Checked on: ${DateFormat('dd/MM/yyyy, hh:mm').format(record.dateTime)}",
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  },
                );
              }
            }
          }
        },
      ),
    );
  }

  Future<List<BMIRecord>> _getBMIRecords() async {
    try {
      return await getBMIRecords();
    } catch (e) {
      // Handle error gracefully (consider showing a user-friendly message)
      print('Error getting BMI records from Hive: $e');
      return [];
    }
  }
}
