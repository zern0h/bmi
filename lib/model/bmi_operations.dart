import 'package:hive/hive.dart';
import 'bmi_record.dart';

Future<void> saveBMIRecord(double bmiScore, String bmiStatus) async {
  final bmiBox = await Hive.openBox<BMIRecord>('bmi_records');
  final record = BMIRecord(bmiScore: bmiScore, bmiStatus: bmiStatus, dateTime: DateTime.now());
  await bmiBox.add(record);
}

Future<List<BMIRecord>> getBMIRecords() async {
  final bmiBox = await Hive.openBox<BMIRecord>('bmi_records');
  return bmiBox.values.toList();
}
