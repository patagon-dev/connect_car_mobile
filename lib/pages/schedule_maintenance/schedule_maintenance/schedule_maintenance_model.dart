import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/subscriptions/car_description/car_description_widget.dart';
import 'schedule_maintenance_widget.dart' show ScheduleMaintenanceWidget;
import 'package:flutter/material.dart';

class ScheduleMaintenanceModel
    extends FlutterFlowModel<ScheduleMaintenanceWidget> {
  ///  Local state fields for this page.

  int? selectedDateIndex;

  AddressModelStruct? addressModel;
  void updateAddressModelStruct(Function(AddressModelStruct) updateFn) =>
      updateFn(addressModel ??= AddressModelStruct());

  String? selectedDate = '';

  bool isApicallSuccess = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (get user address)] action in schedule_maintenance widget.
  ApiCallResponse? userAddressResponse;
  // Model for car_description component.
  late CarDescriptionModel carDescriptionModel;
  // Stores action output result for [Bottom Sheet - fill_address_component] action in Text widget.
  AddressModelStruct? addressResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    carDescriptionModel = createModel(context, () => CarDescriptionModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    carDescriptionModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
