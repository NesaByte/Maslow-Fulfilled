import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:my_needs/json_data.dart';

class Calendar extends StatefulWidget {
  static const String id = 'calendar';

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> with TickerProviderStateMixin {
  CalendarController _calendarController;
  AnimationController _animationController;
  final _selectedDay = DateTime.now();
  String pickedDay = "";
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

    /**/ _events = {
      DateTime(2020, 11, 11): ['Actualization'],
      DateTime(2020, 12, 11): ['Esteem'],
      DateTime(2020, 11, 11): ['Belonging'],
      DateTime(2020, 11, 11): ['Safety'],
      DateTime(2020, 11, 11): ['Physiological'],
      DateTime(2020, 11, 13): ['Actualization'],
      DateTime(2020, 12, 13): ['Esteem'],
      DateTime(2020, 11, 13): ['Belonging'],
      DateTime(2020, 11, 13): ['Safety'],
      DateTime(2020, 11, 13): ['Physiological'],
      DateTime(2020, 11, 21): ['Actualization'],
      DateTime(2020, 12, 21): ['Esteem'],
      DateTime(2020, 11, 21): ['Belonging'],
      DateTime(2020, 11, 21): ['Safety'],
      DateTime(2020, 11, 21): ['Physiological'],
      DateTime(2020, 11, 30): ['Actualization'],
      DateTime(2020, 12, 30): ['Esteem'],
      DateTime(2020, 11, 30): ['Belonging'],
      DateTime(2020, 11, 30): ['Safety'],
      DateTime(2020, 11, 30): ['Physiological'],
    };
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
      pickedDay = day.toString();
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

  String testDate(String day) {
    return day;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTableCalendar(),
          Expanded(child: _buildBody()),
        ],
      ),
    );
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

  Widget _buildBody() {
    return _buildList(data_test);
  }

  Widget _buildList(List<Map<String, dynamic>> dataList) {
    return ListView.builder(
        padding: const EdgeInsets.all(18.0),
        itemCount: dataList.length,
        itemBuilder: (context, i) {
          return _buildUserGrowth(dataList[i]);
        });
  }

  Widget _buildUserGrowth(Map<String, dynamic> data) {
    String date;
    String sdate;

    if (pickedDay != "") {
      sdate = pickedDay.substring(0, 10);
    } else if (_selectedDay != null) {
      date = _selectedDay.toString();
      sdate = date.substring(0, 10);
    }

    return Column(
      children: <Widget>[
        if (sdate == data["mdate"])
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 140,
              animation: true,
              lineHeight: 20.0,
              center: new Text(data["name"]),
              animationDuration: 2500,
              percent: int.parse(data["score"].toString()) / 100,
              trailing: Text(" " + data["score"].toString() + "% "),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: colorConvert(data["name"]),
            ),
          ),
      ],
    );
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
