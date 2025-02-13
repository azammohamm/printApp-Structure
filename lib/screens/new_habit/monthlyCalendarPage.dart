import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthlyCalendarPage extends StatefulWidget {
  @override
  _MonthlyCalendarPageState createState() => _MonthlyCalendarPageState();
}

class _MonthlyCalendarPageState extends State<MonthlyCalendarPage> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Calendar'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2021, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          // Use `_selectedDay` to determine if a day is selected
          return isSameDay(_selectedDay, day);
        },
        calendarFormat: _calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update `_focusedDay` as well
          });
        },
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(
            color: Colors.blueAccent,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
        ),
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, day, events) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.red, // Event marker color
                shape: BoxShape.circle,
              ),
              width: 8,
              height: 8,
            );
          },
        ),
      ),
    );
  }
}
