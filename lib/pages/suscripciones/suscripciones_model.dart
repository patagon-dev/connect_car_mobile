import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'suscripciones_widget.dart' show SuscripcionesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SuscripcionesModel extends FlutterFlowModel<SuscripcionesWidget> {
  ///  Local state fields for this page.

  List<dynamic> imageList = [];
  void addToImageList(dynamic item) => imageList.add(item);
  void removeFromImageList(dynamic item) => imageList.remove(item);
  void removeAtIndexFromImageList(int index) => imageList.removeAt(index);
  void insertAtIndexInImageList(int index, dynamic item) =>
      imageList.insert(index, item);
  void updateImageListAtIndex(int index, Function(dynamic) updateFn) =>
      imageList[index] = updateFn(imageList[index]);

  List<dynamic> subscriptionList = [];
  void addToSubscriptionList(dynamic item) => subscriptionList.add(item);
  void removeFromSubscriptionList(dynamic item) =>
      subscriptionList.remove(item);
  void removeAtIndexFromSubscriptionList(int index) =>
      subscriptionList.removeAt(index);
  void insertAtIndexInSubscriptionList(int index, dynamic item) =>
      subscriptionList.insert(index, item);
  void updateSubscriptionListAtIndex(int index, Function(dynamic) updateFn) =>
      subscriptionList[index] = updateFn(subscriptionList[index]);

  List<dynamic> vehicleList = [];
  void addToVehicleList(dynamic item) => vehicleList.add(item);
  void removeFromVehicleList(dynamic item) => vehicleList.remove(item);
  void removeAtIndexFromVehicleList(int index) => vehicleList.removeAt(index);
  void insertAtIndexInVehicleList(int index, dynamic item) =>
      vehicleList.insert(index, item);
  void updateVehicleListAtIndex(int index, Function(dynamic) updateFn) =>
      vehicleList[index] = updateFn(vehicleList[index]);

  bool showLoader = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (User Suspcriptions)] action in suscripciones widget.
  ApiCallResponse? suscripcionesResponse;
  // Stores action output result for [Backend Call - API (User Vehicle Image)] action in suscripciones widget.
  ApiCallResponse? vehicleImageResponse;
  // Stores action output result for [Backend Call - API (Subscriptions Vehicle)] action in suscripciones widget.
  ApiCallResponse? vehicleResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
