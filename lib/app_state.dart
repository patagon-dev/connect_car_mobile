import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
  set stepperIndex(int value) {
    _stepperIndex = value;
  }

  int _currentTabIndex = 0;
  int get currentTabIndex => _currentTabIndex;
  set currentTabIndex(int value) {
    _currentTabIndex = value;
  }

  String _userSessionToken = '';
  String get userSessionToken => _userSessionToken;
  set userSessionToken(String value) {
    _userSessionToken = value;
    prefs.setString('ff_userSessionToken', value);
  }

  String _userSessionUserId = '';
  String get userSessionUserId => _userSessionUserId;
  set userSessionUserId(String value) {
    _userSessionUserId = value;
    prefs.setString('ff_userSessionUserId', value);
  }

  String _signInEmail = '';
  String get signInEmail => _signInEmail;
  set signInEmail(String value) {
    _signInEmail = value;
  }

  String _signInPassword = '';
  String get signInPassword => _signInPassword;
  set signInPassword(String value) {
    _signInPassword = value;
  }

  String _resetEmail = '';
  String get resetEmail => _resetEmail;
  set resetEmail(String value) {
    _resetEmail = value;
  }

  bool _authLoader = false;
  bool get authLoader => _authLoader;
  set authLoader(bool value) {
    _authLoader = value;
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String value) {
    _refreshToken = value;
    prefs.setString('ff_refreshToken', value);
  }

  dynamic _article = jsonDecode(
      '{"subject":"My subject","reply_to":"nmella@cenabast.cl","from":"nmella@cenabast.cl","body":"Help wanted 4!","type":"web","internal":false,"content_type":"text/html"}');
  dynamic get article => _article;
  set article(dynamic value) {
    _article = value;
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
