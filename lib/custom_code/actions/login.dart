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

import '/backend/api_requests/api_calls.dart';

Future<String?> login(
    BuildContext context, String? email, String? password) async {
  _toggleLoading();
  var response = await UserLoginCall.call(
    email: FFAppState().signInEmail,
    password: FFAppState().signInPassword,
  );
  _toggleLoading();

  print(response.jsonBody);
  if (!response.succeeded) {
    var res = UserLoginCall.error(response.jsonBody ?? '');
    _customWarning(context, _msg[res] ?? _unknownError);
    return res;
  }
  String? token = UserLoginCall.token(response.jsonBody ?? '');
  if (token == null) {
    var res = 'No token';
    _customWarning(context, res);
    return res;
  }
  String? userId = UserLoginCall.userId(response.jsonBody ?? '');
  if (userId == null) {
    var res = 'Sin identificación de usuario';
    _customWarning(context, res);
    return res;
  }

  String? refreshToken = UserLoginCall.refreshToken(response.jsonBody ?? '');
  int? expiration = UserLoginCall.expiration(response.jsonBody ?? '');
  int? minsToRefresh;
  if (expiration != null) {
    minsToRefresh = DateTime.fromMillisecondsSinceEpoch(expiration * 1000)
        .difference(DateTime.now())
        .inSeconds;
  }

  FFAppState()
    ..userSessionToken = token
    ..userSessionUserId = userId
    ..refreshToken = refreshToken ?? ''
    ..minsToRefresh = minsToRefresh ?? 59;

  FFAppState().loginPreferences = true;

  context.goNamed('suscripciones');
  _refreshTokenDelayed();
  return null;
}

_toggleLoading() {
  FFAppState().authLoader = !FFAppState().authLoader;
  FFAppState().update(() {});
}

void _customWarning(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: TextStyle(
          color: FlutterFlowTheme.of(context).primaryText,
        ),
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: Colors.red,
    ),
  );
}

void _refreshTokenDelayed() {
  Future.delayed(Duration(minutes: FFAppState().minsToRefresh), () async {
    print('REFRESH');
    var res = await _refresh();
  });
}

Future<String?> _refresh() async {
  var response = await RefreshTokenCall.call(
    refreshToken: FFAppState().refreshToken,
  );
  print(response.jsonBody);
  if (!response.succeeded) {
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
    ..userSessionToken = RefreshTokenCall.accessToken((response.jsonBody ?? ''))
    ..refreshToken = RefreshTokenCall.refreshToken((response.jsonBody ?? ''))
    ..minsToRefresh = minsToRefresh ?? 59;
  _refreshTokenDelayed();
  return null;
}

const Map<String, String> _msg = {
  'Invalid credentials provided': 'Email o Contraseña inválido'
};
const String _unknownError = 'Error desconocido';
