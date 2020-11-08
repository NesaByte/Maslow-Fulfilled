import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:my_needs/json_data.dart';

class Calendar extends StatefulWidget {
  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> with TickerProviderStateMixin {
  CalendarController _calendarController;
  AnimationController _animationController;

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
    print('CALLBACK: _onDaySelected');
    setState(() {});
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTableCalendar(),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return _buildList(data_test);
  }

  Widget _buildList(List<Map<String, dynamic>> dataList) {
    return ListView.builder(
        padding: const EdgeInsets.all(18.0),
        itemCount: dataList.length,
        itemBuilder: (context, i) {
          //if(dataList[context."mdate"].toString() == "2020-11-25") {
          return _buildUserGrowth(dataList[i]);}
          //else
          //  return null;
       // }
    );
  }
  Widget _buildUserGrowth(Map<String, dynamic> data) {

      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: new LinearPercentIndicator(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 140,
              animation: true,
              lineHeight: 20.0,
              center: new Text(data["name"]),
              animationDuration: 2500,
              percent: int.parse(data["score"].toString()) / 100,
              leading: Text(data["score"].toString() + "% "),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Theme
                  .of(context)
                  .primaryColor,
            ),
          ),
        ],
      );
    /*}
    else{
      return Column(
          children: <Widget>[
          Text('No Data'),
    ]
      );
    }
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 3),
          child: new LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 140,
            animation: true,
            lineHeight: 20.0,
            center: new Text("SELF ACTUALIZATION"),
            animationDuration: 2500,
            percent: actualization / 100,
            leading: Text(actualization.toString() + "% "),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.red,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 3),
          child: new LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 140,
            animation: true,
            lineHeight: 20.0,
            center: new Text("ESTEEM"),
            animationDuration: 2500,
            percent: esteem / 100,
            leading: Text(esteem.toString() + "% "),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.orange,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 3),
          child: new LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 140,
            animation: true,
            lineHeight: 20.0,
            center: new Text("BELONGING"),
            animationDuration: 2500,
            percent: belonging / 100,
            leading: Text(belonging.toString() + "% "),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.deepPurple,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 3),
          child: new LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 140,
            animation: true,
            lineHeight: 20.0,
            center: new Text("SAFETY"),
            animationDuration: 2500,
            percent: safety / 100,
            leading: Text(safety.toString() + "% "),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.blue,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 3),
          child: new LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 140,
            animation: true,
            lineHeight: 20.0,
            center: new Text("PHYSIOLOGICAL"),
            animationDuration: 2500,
            percent: physiological / 100,
            leading: Text(physiological.toString() + "% "),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.green,
          ),
        ),
      ],
    );*/
  }


  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      //events: _actions,
      //holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        selectedColor: Theme.of(context).primaryColor,
        todayColor: Colors.pinkAccent,
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
        contentPadding: const EdgeInsets.only(bottom: 0, left: 0, right: 0),
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
