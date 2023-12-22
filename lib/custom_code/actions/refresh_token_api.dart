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

import 'package:connect_car/backend/api_requests/api_calls.dart';

Future<bool> refreshTokenApi(BuildContext context) async {
  // Add your function code here!

  await _refresh(context);
  _refreshTokenDelayed(context);
  return true;
}

Future<String?> _refresh(context) async {
  var response = await RefreshTokenCall.call(
    refreshToken: FFAppState().refreshToken,
  );
  print(response.jsonBody);
  if (!response.succeeded) {
    // FFAppState().loginPreferences = false;
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(
    //     builder: ((context) => LoginWidget()),
    //   ),
    // );
    var res = UserLoginCall.error(response.jsonBody ?? '');
    return res;
  }

  int? expiration = UserLoginCall.expiration(response.jsonBody ?? '');
  int? minsToRefresh;
  if (expiration != null) {
    minsToRefresh = DateTime.fromMillisecondsSinceEpoch(expiration * 1000)
        .difference(DateTime.now())
        .inSeconds;
  }
  FFAppState()
    ..userSessionToken =
        RefreshTokenCall.accessToken((response.jsonBody ?? '')) ?? ''
    ..refreshToken =
        RefreshTokenCall.refreshToken((response.jsonBody ?? '')) ?? ''
    ..minsToRefresh = minsToRefresh ?? 59;
  _refreshTokenDelayed(context);
  return null;
}

void _refreshTokenDelayed(context) {
  Future.delayed(Duration(minutes: FFAppState().minsToRefresh), () async {
    print('REFRESH');
    var res = await _refresh(context);
  });
}
