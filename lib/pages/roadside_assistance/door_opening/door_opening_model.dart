import '/flutter_flow/flutter_flow_util.dart';
import '/pages/roadside_assistance/call_center_other_information/call_center_other_information_widget.dart';
import 'door_opening_widget.dart' show DoorOpeningWidget;
import 'package:flutter/material.dart';

class DoorOpeningModel extends FlutterFlowModel<DoorOpeningWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for call_center_other_information component.
  late CallCenterOtherInformationModel callCenterOtherInformationModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    callCenterOtherInformationModel =
        createModel(context, () => CallCenterOtherInformationModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    callCenterOtherInformationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
