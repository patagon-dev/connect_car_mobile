import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userSessionToken =
          prefs.getString('ff_userSessionToken') ?? _userSessionToken;
    });
    _safeInit(() {
      _userSessionUserId =
          prefs.getString('ff_userSessionUserId') ?? _userSessionUserId;
    });
    _safeInit(() {
      _refreshToken = prefs.getString('ff_refreshToken') ?? _refreshToken;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _stepperIndex = 0;
  int get stepperIndex => _stepperIndex;
  set stepperIndex(int _value) {
    _stepperIndex = _value;
  }

  int _currentTabIndex = 0;
  int get currentTabIndex => _currentTabIndex;
  set currentTabIndex(int _value) {
    _currentTabIndex = _value;
  }

  String _userSessionToken = '';
  String get userSessionToken => _userSessionToken;
  set userSessionToken(String _value) {
    _userSessionToken = _value;
    prefs.setString('ff_userSessionToken', _value);
  }

  String _userSessionUserId = '';
  String get userSessionUserId => _userSessionUserId;
  set userSessionUserId(String _value) {
    _userSessionUserId = _value;
    prefs.setString('ff_userSessionUserId', _value);
  }

  String _signInEmail = '';
  String get signInEmail => _signInEmail;
  set signInEmail(String _value) {
    _signInEmail = _value;
  }

  String _signInPassword = '';
  String get signInPassword => _signInPassword;
  set signInPassword(String _value) {
    _signInPassword = _value;
  }

  String _resetEmail = '';
  String get resetEmail => _resetEmail;
  set resetEmail(String _value) {
    _resetEmail = _value;
  }

  bool _authLoader = false;
  bool get authLoader => _authLoader;
  set authLoader(bool _value) {
    _authLoader = _value;
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String _value) {
    _refreshToken = _value;
    prefs.setString('ff_refreshToken', _value);
  }

  dynamic _article = jsonDecode(
      '{\"subject\":\"My subject\",\"reply_to\":\"nmella@cenabast.cl\",\"from\":\"nmella@cenabast.cl\",\"body\":\"Help wanted 4!\",\"type\":\"web\",\"internal\":false,\"content_type\":\"text/html\"}');
  dynamic get article => _article;
  set article(dynamic _value) {
    _article = _value;
  }

  List<String> _dateList = [
    'Lunes 13 de Noviembre',
    'Martes  14 de Noviembre',
    'Miércoles 15 de Noviembre ',
    'Jueves 16 de Noviembre',
    'Viernes 17 de Noviembre'
  ];
  List<String> get dateList => _dateList;
  set dateList(List<String> _value) {
    _dateList = _value;
  }

  void addToDateList(String _value) {
    _dateList.add(_value);
  }

  void removeFromDateList(String _value) {
    _dateList.remove(_value);
  }

  void removeAtIndexFromDateList(int _index) {
    _dateList.removeAt(_index);
  }

  void updateDateListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _dateList[_index] = updateFn(_dateList[_index]);
  }

  void insertAtIndexInDateList(int _index, String _value) {
    _dateList.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
