import 'package:scheduler/models/Day.dart';
import 'package:scheduler/scheduler.dart' as scheduler;

void main(List<String> arguments) {
  List<Day> february = scheduler.generateDaysInMonth(2, 2023, 28, []);

  print(february.toString());
}
