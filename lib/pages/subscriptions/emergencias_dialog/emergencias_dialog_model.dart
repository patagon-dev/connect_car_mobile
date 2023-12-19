import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'emergencias_dialog_widget.dart' show EmergenciasDialogWidget;
import 'package:flutter/material.dart';

class EmergenciasDialogModel extends FlutterFlowModel<EmergenciasDialogWidget> {
  ///  Local state fields for this component.

  AddressModelStruct? addressModeldata;
  void updateAddressModeldataStruct(Function(AddressModelStruct) updateFn) =>
      updateFn(addressModeldata ??= AddressModelStruct());

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
