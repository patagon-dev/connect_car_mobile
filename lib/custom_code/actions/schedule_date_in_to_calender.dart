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

import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

import 'index.dart'; // Imports other custom actions

import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';

// import 'package:add_2_calendar/add_2_calendar.dart';

Future<bool> scheduleDateInToCalender(
  String eventTitle,
  String? eventDescription,
  String? location,
  DateTime startDateTime,
  DateTime endDateTime,
) async {
  // Add your function code here!

  final scopes = [CalendarApi.calendarScope];

  ClientId credentials = isAndroid
      ? ClientId("104739033106499293931", "")
      : ClientId("104739033106499293931", "");
  // if (isAndroid) {
  //   _credentials = ClientId("104739033106499293931", "");
  // } else if (isiOS) {
  //   //TODO: set client if of IOS
  //   _credentials = ClientId(
  //       "YOUR_CLIENT_ID_FOR_IOS_APP_RETRIEVED_FROM_Google_Console_Project_EARLIER",
  //       "");
  // }

  Event event = Event(
      summary: eventDescription,
      start: EventDateTime(dateTime: startDateTime, timeZone: "GMT+05:00"),
      end: EventDateTime(
          dateTime: endDateTime,
          timeZone: "GMT+05:00")); // Create object of event
  // event.summary = eventDescription; //Setting summary of object
  //
  // EventDateTime start = EventDateTime(); //Setting start time
  // start.dateTime = startDateTime;
  // start.timeZone = "GMT+05:00";
  // event.start = start;
  //
  // EventDateTime end = EventDateTime(); //setting end time
  // end.timeZone = "GMT+05:00";
  // end.dateTime = endDateTime;
  // event.end = end;

  return await insertEvent(event, scopes, credentials);

  // Add2Calendar.addEvent2Cal(
  //   Event(
  //     title: eventTitle,
  //     description: eventDescription,
  //     location: location,
  //     startDate: startDateTime,
  //     endDate: endDateTime,
  //   ),
  // );
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
void prompt(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

Future<bool> insertEvent(event, List<String> scopes, ClientId clientId) async {
  try {
    await clientViaUserConsent(
            ClientId(
              "104739033106499293931",
            ),
            scopes,
            prompt)
        .then((AuthClient client) {
      var calendar = CalendarApi(client);
      String calendarId = "primary";
      calendar.events.insert(event, calendarId).then((value) {
        print("ADDEDDD_________________${value.status}");

        if (value.status == "confirmed") {
          log('Event added in google calendar');
          return true;
        } else {
          log("Unable to add event in google calendar");
          return false;
        }
      });
    });
    return false;
  } catch (e) {
    log('Error creating event $e');
    return false;
  }
}
