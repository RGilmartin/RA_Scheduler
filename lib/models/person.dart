class Person {
  Person({
    required this.name,
    required this.email,
    required this.unavailableDates,
  });

  String name = "";
  String email = "";
  int _cWeekdayP = 0;
  int _cWeekendP = 0;
  int _cWeekdayS = 0;
  int _cWeekendS = 0;
  List<DateTime> unavailableDates = [];

  set cWeekdayP(int newVal) => this._cWeekdayP = newVal;
  set cWeekendP(int newVal) => this._cWeekendP = newVal;
  set cWeekdayS(int newVal) => this._cWeekdayS = newVal;
  set cWeekendS(int newVal) => this._cWeekendS = newVal;
  int get cWeekdayP => this._cWeekdayP;
  int get cWeekendP => this._cWeekendP;
  int get cWeekdayS => this._cWeekdayS;
  int get cWeekendS => this._cWeekendS;
}
