import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/subscriptions/car_description/car_description_widget.dart';
import 'suscripciones_widget.dart' show SuscripcionesWidget;
import 'package:flutter/material.dart';

class SuscripcionesModel extends FlutterFlowModel<SuscripcionesWidget> {
  ///  Local state fields for this page.

  bool showLoader = false;

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

  List<dynamic> vehicleImageList = [];
  void addToVehicleImageList(dynamic item) => vehicleImageList.add(item);
  void removeFromVehicleImageList(dynamic item) =>
      vehicleImageList.remove(item);
  void removeAtIndexFromVehicleImageList(int index) =>
      vehicleImageList.removeAt(index);
  void insertAtIndexInVehicleImageList(int index, dynamic item) =>
      vehicleImageList.insert(index, item);
  void updateVehicleImageListAtIndex(int index, Function(dynamic) updateFn) =>
      vehicleImageList[index] = updateFn(vehicleImageList[index]);

  int? current = 0;

  int? end = 8;

  dynamic profileJson;

  List<DocumentReference> userId = [];
  void addToUserId(DocumentReference item) => userId.add(item);
  void removeFromUserId(DocumentReference item) => userId.remove(item);
  void removeAtIndexFromUserId(int index) => userId.removeAt(index);
  void insertAtIndexInUserId(int index, DocumentReference item) =>
      userId.insert(index, item);
  void updateUserIdAtIndex(int index, Function(DocumentReference) updateFn) =>
      userId[index] = updateFn(userId[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (user profile)] action in suscripciones widget.
  ApiCallResponse? profileResponse;
  // Stores action output result for [Backend Call - API (refresh token)] action in suscripciones widget.
  ApiCallResponse? resetTokenResponse;
  // Stores action output result for [Backend Call - API (User Suspcriptions)] action in suscripciones widget.
  ApiCallResponse? suscripcionesResponse;
  // Stores action output result for [Backend Call - API (Subscriptions Vehicle)] action in suscripciones widget.
  ApiCallResponse? subscriptionVehicleResponse;
  // Stores action output result for [Backend Call - API (User Vehicle Image)] action in suscripciones widget.
  ApiCallResponse? vehicleImage;
  // Models for car_description dynamic component.
  late FlutterFlowDynamicModels<CarDescriptionModel> carDescriptionModels;
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    carDescriptionModels =
        FlutterFlowDynamicModels(() => CarDescriptionModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    carDescriptionModels.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
