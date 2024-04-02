import 'package:hive/hive.dart';

part '../generated/bmi_record.g.dart';

@HiveType(typeId: 0)
class BMIRecord extends HiveObject {
  @HiveField(0)
  double bmiScore;

  @HiveField(1)
  DateTime dateTime;

  @HiveField(2)
  String bmiStatus;

  BMIRecord({required this.bmiScore, required this.dateTime, required this.bmiStatus});
}
