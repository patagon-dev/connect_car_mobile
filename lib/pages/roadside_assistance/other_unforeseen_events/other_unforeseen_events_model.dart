import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/roadside_assistance/call_center_other_information/call_center_other_information_widget.dart';
import 'other_unforeseen_events_widget.dart' show OtherUnforeseenEventsWidget;
import 'package:flutter/material.dart';

class OtherUnforeseenEventsModel
    extends FlutterFlowModel<OtherUnforeseenEventsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for call_center_other_information component.
  late CallCenterOtherInformationModel callCenterOtherInformationModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    callCenterOtherInformationModel =
        createModel(context, () => CallCenterOtherInformationModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    callCenterOtherInformationModel.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
