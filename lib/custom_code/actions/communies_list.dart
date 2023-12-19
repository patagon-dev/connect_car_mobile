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

Future<List<CommunesModelStruct>?> communiesList(
  String? region,
  List<RegionModelStruct> regionList,
) async {
  // Add your function code here!
  List<CommunesModelStruct> communies = [];
  var data = regionList.firstWhere((element) => element.name == region);
  communies.addAll(data.communes);
  return communies ?? [];
}
