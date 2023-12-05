import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'fill_address_component_widget.dart' show FillAddressComponentWidget;
import 'package:flutter/material.dart';

class FillAddressComponentModel
    extends FlutterFlowModel<FillAddressComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Calle widget.
  FocusNode? calleFocusNode;
  TextEditingController? calleController;
  String? Function(BuildContext, String?)? calleControllerValidator;
  String? _calleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Departamentocasapisoetc widget.
  FocusNode? departamentocasapisoetcFocusNode;
  TextEditingController? departamentocasapisoetcController;
  String? Function(BuildContext, String?)?
      departamentocasapisoetcControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for Ciudad widget.
  FocusNode? ciudadFocusNode;
  TextEditingController? ciudadController;
  String? Function(BuildContext, String?)? ciudadControllerValidator;
  String? _ciudadControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Comuna widget.
  FocusNode? comunaFocusNode;
  TextEditingController? comunaController;
  String? Function(BuildContext, String?)? comunaControllerValidator;
  String? _comunaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    calleControllerValidator = _calleControllerValidator;
    ciudadControllerValidator = _ciudadControllerValidator;
    comunaControllerValidator = _comunaControllerValidator;
  }

  @override
  void dispose() {
    calleFocusNode?.dispose();
    calleController?.dispose();

    departamentocasapisoetcFocusNode?.dispose();
    departamentocasapisoetcController?.dispose();

    ciudadFocusNode?.dispose();
    ciudadController?.dispose();

    comunaFocusNode?.dispose();
    comunaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
