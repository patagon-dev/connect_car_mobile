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
import '/auth/firebase_auth/auth_util.dart';

String sortEmail(String email) {
  try {
    return email[0] + '****@' + email.split('@').last;
  } catch (e) {
    return '';
  }
}

String sortLicencePlate(String input) {
  if (input.toString().toLowerCase() != 'null') {
    String output = "";
    for (int i = 0; i < input.length; i++) {
      if (i % 2 == 0) {
        output += input[i];
      } else {
        output += input[i] + " ";
      }
    }

    return output;
  } else {
    return "";
  }
}

List<DateTime> dateLists(
  int difference,
  int totaldateShows,
) {
  List<DateTime> dates = [];
  //+1 because it will consider today date
  final currentDate = DateTime.now().add(Duration(days: difference));
  // print("Current date----${currentDate.toString()}");
  for (int i = 0; i < 7; i++) {
    if (dates.length < totaldateShows) {
      var today = currentDate.add((Duration(days: i)));
      if (today.weekday == DateTime.saturday ||
          today.weekday == DateTime.sunday) {
        continue;
      } else {
        dates.add(currentDate.add(Duration(days: i)));
      }
    } else {
      break;
    }
  }
  // print(dates.toString());
  return dates;

// List<DateTime> dateLists(int difference) {
//   List<DateTime> dates = [];
//   final currentDate = DateTime.now().add(Duration(days: difference));
//   print("Current date----${currentDate.toString()}");
//   for (int i = 0; i < 7; i++) {
//     if (dates.length < 5) {
//       var today = currentDate.add((Duration(days: i)));
//       if (today.weekday == DateTime.saturday ||
//           today.weekday == DateTime.sunday) {
//         continue;
//       } else {
//         dates.add(currentDate.add(Duration(days: i)));
//       }
//     } else {
//       break;
//     }
//   }
//   print(dates.toString());
//   return dates;
// }
}

String setImage(dynamic response) {
  String defaultImage =
      "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/connect-car-v1-2i59cm/assets/shbt25lwpskw/car_1.png";

  if ((response["data"] as List).isNotEmpty) {
    return response["data"][0]["url"] ?? defaultImage;
  }

  return defaultImage;
}

DateTime stringToDateTime(String selectedDate) {
  return DateTime.parse(selectedDate);
}

bool resetToken(String error) {
  print("ERROR:------->${error}");
  if (error == "Invalid token provided") {
    return true;
  }
  return false;
}

DateTime doubleToDate(
  double dateInMiliSec,
  bool? isThirtyDayExpand,
) {
  return isThirtyDayExpand ?? false
      ? DateTime.fromMillisecondsSinceEpoch(
              int.parse((dateInMiliSec.floor()).toString()) * 1000)
          .add(Duration(days: 30))
      : DateTime.fromMillisecondsSinceEpoch(
          int.parse((dateInMiliSec.floor()).toString()) * 1000);
}

bool checkRefreshTokenIsValid(String? refreshToken) {
  return refreshToken == "Invalid refresh token provided" ? true : false;
}

String convertEmailtoBase(
  String userEmail,
  String userPassword,
) {
  return base64.encode(utf8.encode("$userEmail:$userPassword"));
}

dynamic setJsonForSendindSceduleMail(
  String subject,
  String replyTo,
  String from,
  String body,
  String type,
  bool internal,
  String contentType,
) {
  return {
    "subject": subject,
    "reply_to": replyTo,
    "from": from,
    "body": body,
    "type": type,
    "internal": internal,
    "content_type": contentType
  };
}

bool rutValidation(String rut) {
  rut = rut.replaceAll(RegExp(r'\D'), '');
  int checkDigit = int.parse(rut[rut.length - 1]);
  rut = rut.substring(0, rut.length - 1);

  List<int> reversedRut =
      rut.split('').map((e) => int.parse(e)).toList().reversed.toList();

  int sum = 0;
  int multiplier = 2;
  for (int digit in reversedRut) {
    sum += digit * multiplier;
    multiplier = multiplier < 7 ? multiplier + 1 : 2;
  }

  int remainder = sum % 11;

  int calculatedCheckDigit = remainder == 0 ? 0 : 11 - remainder;
  print("Test:-----> $rut ${checkDigit == calculatedCheckDigit}");
  return checkDigit == calculatedCheckDigit;
}
