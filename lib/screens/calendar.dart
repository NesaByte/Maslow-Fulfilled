import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:my_needs/util/json_data.dart';
import 'package:provider/provider.dart';
import 'package:my_needs/firebase/models/dailyProgress_class.dart';
import 'package:my_needs/firebase/models/dailyProgress_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Calendar extends StatefulWidget {
  static const String id = 'calendar';

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> with TickerProviderStateMixin {
  CalendarController _calendarController;
  AnimationController _animationController;
  final _selectedDay = DateTime.now();
  DateTime pickedDay = DateTime.now();
  Map<DateTime, List> _events;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List Holiday) {
    print('CALLBACK: _onDaySelected' + day.toString());
    setState(() {
      pickedDay = day;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  void _getDates(List<DailyProgress> dailyProgress) async {
    print('CALLBACK: _getDates');

    _events = {};
    for (int index = 0; index < dailyProgress.length; index++) {
      int day = dailyProgress[index].sDate.day;
      int month = dailyProgress[index].sDate.month;
      int year = dailyProgress[index].sDate.year;

      try {
        _events.addAll({
          DateTime(year, month, day): ["Flag"]
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<List<DailyProgress>>(
        stream: DailyProgressDatabase(user.uid).getDailyProgressStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DailyProgress> dailyProgress = snapshot.data;
            _getDates(dailyProgress);
            dailyProgress.removeWhere((element) =>
            !(pickedDay.day == element.sDate.day &&
                pickedDay.month == element.sDate.month &&
                pickedDay.year == element.sDate.year));

            return new Scaffold(
              appBar: new AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text("Calendar"),
              ),
              body: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildTableCalendar(),
                  new Expanded(
                    //child: _buildCard(),
                    child: new ListView.builder(
                      itemCount: dailyProgress.length,
                      itemBuilder: (BuildContext ctxt, int index) => Center(
                        child: _buildUserGrowth(index, dailyProgress),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text("No Goals Retrieved");
          }
        });
  }

  Color colorConvert(String name) {
    if (name == "Actualization") {
      return Color(0xFFFF0000);
    } else if (name == "Esteem") {
      return Color(0xFFFF8000);
    } else if (name == "Belonging") {
      return Color(0xFF8000ff);
    } else if (name == "Safety") {
      return Color(0xFF0080ff);
    } else if (name == "Physiological") {
      return Color(0xFF40ff00);
    } else
      return Color(0xFF000000);
  }

  Widget _buildUserGrowth(int index, List<DailyProgress> dailyProgress) {
    if (pickedDay.day == dailyProgress[index].sDate.day &&
        pickedDay.month == dailyProgress[index].sDate.month &&
        pickedDay.year == dailyProgress[index].sDate.year)
      return Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 140,
              animation: true,
              lineHeight: 20.0,
              center: new Text("Actualization"),
              animationDuration: 2500,
              percent: dailyProgress[index].sActualization / 100,
              trailing: Text(
                  " " + dailyProgress[index].sActualization.toString() + "% "),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: colorConvert("Actualization"),
            ),
          ),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 140,
              animation: true,
              lineHeight: 20.0,
              center: new Text("Esteem"),
              animationDuration: 2500,
              percent: dailyProgress[index].sEsteem / 100,
              trailing:
                  Text(" " + dailyProgress[index].sEsteem.toString() + "% "),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: colorConvert("Esteem"),
            ),
          ),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 140,
              animation: true,
              lineHeight: 20.0,
              center: new Text("Belonging"),
              animationDuration: 2500,
              percent: dailyProgress[index].sBelonging / 100,
              trailing:
                  Text(" " + dailyProgress[index].sBelonging.toString() + "% "),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: colorConvert("Belonging"),
            ),
          ),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 140,
              animation: true,
              lineHeight: 20.0,
              center: new Text("Safety"),
              animationDuration: 2500,
              percent: dailyProgress[index].sSafety / 100,
              trailing:
                  Text(" " + dailyProgress[index].sSafety.toString() + "% "),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: colorConvert("Safety"),
            ),
          ),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 140,
              animation: true,
              lineHeight: 20.0,
              center: new Text("Physiological"),
              animationDuration: 2500,
              percent: dailyProgress[index].sPhysiological / 100,
              trailing: Text(
                  " " + dailyProgress[index].sPhysiological.toString() + "% "),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: colorConvert("Physiological"),
            ),
          ),
        ],
      );
    return new Column();
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      //holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        selectedColor: Theme.of(context).primaryColor,
        todayColor: Colors.pinkAccent,
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
        //contentPadding: const EdgeInsets.only(bottom: 0, left: 0, right: 0),
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }
}
