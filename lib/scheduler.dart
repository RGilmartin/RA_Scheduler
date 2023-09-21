// Generates a list of Day[]
import 'dart:math';

import 'package:scheduler/models/Day.dart';
import 'package:scheduler/models/day_type.dart';
import 'package:scheduler/models/person.dart';
import 'package:scheduler/models/shift_type.dart';

List<Day> generateDaysInMonth(
    int month, int year, int daysInMonth, List<int> excludeDays) {
  List<Day> days = [];
  DateTime currDate = DateTime(year, month, 1);
  for (int i = 1; i <= daysInMonth; i++) {
    currDate = DateTime(year, month, i);
    if (!excludeDays.contains(currDate.day)) {
      days.add(Day(
          date: DateTime(year, month, i),
          dayType: (currDate.weekday == 4 ||
                  currDate.weekday == 5 ||
                  currDate.weekday == 6)
              ? DayType.weekend
              : DayType
                  .weekday)); // thurs, fri, sat are considered weekends for scheduling purposes
    } else {
      print("skip day ${currDate.day}");
    }
  }

  return days;
}

sortPeopleByLeastDays(
    List<Person> people, DayType dayType, ShiftType shiftType) {
  if (dayType == DayType.weekday && shiftType == ShiftType.Primary) {
    people.sort((Person a, Person b) => a.cWeekdayP.compareTo(b.cWeekdayP));
  } else if (dayType == DayType.weekend && shiftType == ShiftType.Primary) {
    people.sort((Person a, Person b) => a.cWeekendP.compareTo(b.cWeekendP));
  } else if (dayType == DayType.weekday && shiftType == ShiftType.Secondary) {
    people.sort((Person a, Person b) => a.cWeekdayS.compareTo(b.cWeekdayS));
  } else {
    people.sort((Person a, Person b) => a.cWeekendS.compareTo(b.cWeekendS));
  }
}

Day getRandomDayInMonthByPerson(
    List<Day> days, ShiftType shiftType, DayType dayType, Person person) {
  // Sort out invalid day based on availability, dayType, and available shifts

  Iterable<Day> validByDayType =
      days.where((Day day) => day.dayType == dayType);
  Iterable<Day> validByShiftType = validByDayType.where((Day day) =>
      shiftType == ShiftType.Primary
          ? day.primary == null
          : day.secondary == null);
  Iterable<Day> validByAvailability = validByShiftType
      .where((Day day) => !person.unavailableDates.contains(day.date));
  int randInt = Random().nextInt(validByAvailability.length);
  return validByAvailability.elementAt(randInt);
}

List<Day> generateRandShifts() {}
