import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // Add this package to your pubspec.yaml

class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final List<Appointment> _appointments = []; // List to hold appointments

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
        backgroundColor: Colors.blue, // Replace with your primary color
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          TableCalendar(
            focusedDay: _selectedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
          ),
          SizedBox(height: 20),
          _buildAppointmentsList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAppointment,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue, // Replace with your primary color
      ),
    );
  }

  Widget _buildAppointmentsList() {
    // Filter appointments based on selected day
    final appointmentsForDay = _appointments.where((appointment) =>
        isSameDay(_selectedDay, appointment.date)).toList();

    if (appointmentsForDay.isEmpty) {
      return Center(child: Text('No appointments for this day.'));
    }

    return Expanded(
      child: ListView.builder(
        itemCount: appointmentsForDay.length,
        itemBuilder: (context, index) {
          final appointment = appointmentsForDay[index];
          return ListTile(
            title: Text(appointment.title),
            subtitle: Text(appointment.time),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteAppointment(appointment),
            ),
          );
        },
      ),
    );
  }

  void _addAppointment() {
    // Implement the logic to add a new appointment
    print('Adding new appointment...');
    // You can use a dialog or a new screen to input appointment details
  }

  void _deleteAppointment(Appointment appointment) {
    setState(() {
      _appointments.remove(appointment);
    });
  }
}

class Appointment {
  final DateTime date;
  final String title;
  final String time;

  Appointment({
    required this.date,
    required this.title,
    required this.time,
  });
}
