import '/flutter_flow/flutter_flow_util.dart';
import '/pages/roadside_assistance/custom_button/custom_button_widget.dart';
import 'call_center_other_information_widget.dart'
    show CallCenterOtherInformationWidget;
import 'package:flutter/material.dart';

class CallCenterOtherInformationModel
    extends FlutterFlowModel<CallCenterOtherInformationWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for custom_button component.
  late CustomButtonModel customButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customButtonModel = createModel(context, () => CustomButtonModel());
  }

  @override
  void dispose() {
    customButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
