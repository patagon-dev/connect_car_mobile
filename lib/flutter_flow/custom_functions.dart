import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';

String sortEmail(String email) {
  String ext = email.split('@').last;
  return email[0] + '****@' + ext;
}

String sortLicencePlate(String input) {
  String cleanString = input.replaceAll(RegExp(r'[^a-zA-Z]'), '');

  List<String> chunks = [];
  for (int i = 0; i < cleanString.length; i += 2) {
    chunks.add(cleanString.substring(i, i + 2));
  }

  String formattedString = chunks.join(' ');

  return formattedString;
}

List<DateTime> dateLists() {
  List<DateTime> dates = [];
  final currentDate = DateTime.now();
  for (int i = 0; i < 5; i++) {
    dates.add(currentDate.add(Duration(days: i + 1)));
  }
  return dates;
}
