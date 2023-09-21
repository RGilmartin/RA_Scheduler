import 'package:scheduler/models/day_type.dart';
import 'package:scheduler/models/person.dart';
import 'package:scheduler/models/shift_type.dart';
import 'package:scheduler/scheduler.dart';
import 'package:test/test.dart';

void main() {
  test('sort people', () {
    List<Person> people = [
      Person(name: "ryan", email: "email", unavailableDates: []),
      Person(name: "Aimee", email: "email", unavailableDates: []),
      Person(name: "john", email: "email", unavailableDates: [])
    ];

    for (int i = 0; i < people.length; i++) {
      for (int j = 0; j < people.length; j++) {
        people[i].cWeekdayP = i + j;
        people[i].cWeekendP = i + j + 1;
        people[i].cWeekdayS = j;
        people[i].cWeekendS = i;
      }
    }

    people.shuffle();
    for (var person in people) {
      // ignore: prefer_interpolation_to_compose_strings
      print(person.name +
          " wdP: " +
          person.cWeekdayP.toString() +
          ' weP: ' +
          person.cWeekendP.toString() +
          " wdS: " +
          person.cWeekdayS.toString() +
          " weS: " +
          person.cWeekendS.toString());
    }

    sortPeopleByLeastDays(people, DayType.weekday, ShiftType.Primary);
    print("sorted by weekday primary after shuffle");
    for (var person in people) {
      // ignore: prefer_interpolation_to_compose_strings
      print(person.name +
          " wdP: " +
          person.cWeekdayP.toString() +
          ' weP: ' +
          person.cWeekendP.toString() +
          " wdS: " +
          person.cWeekdayS.toString() +
          " weS: " +
          person.cWeekendS.toString());
    }
  });
}
