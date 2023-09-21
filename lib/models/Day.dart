import 'package:scheduler/models/day_type.dart';
import 'package:scheduler/models/person.dart';

class Day {
  DateTime date = DateTime(2022, 1, 1);
  Person? primary;
  Person? secondary;
  DayType dayType = DayType.weekday;

  Day({required this.date, required this.dayType});

  @override
  String toString() {
    return date.month.toString() +
        "-" +
        date.day.toString() +
        " is " +
        date.weekday.toString() +
        " and is a " +
        dayType.toString();
  }
}
