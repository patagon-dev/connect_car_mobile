// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:add_2_calendar/add_2_calendar.dart';

Future scheduleDateInToCalender(
  String eventTitle,
  String? eventDescription,
  String? location,
  DateTime startDateTime,
  DateTime endDateTime,
) async {
  // Add your function code here!
  Add2Calendar.addEvent2Cal(
    Event(
      title: eventTitle,
      description: eventDescription,
      location: location,
      startDate: startDateTime,
      endDate: endDateTime,
    ),
  );
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
