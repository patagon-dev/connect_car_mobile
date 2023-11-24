import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'fill_address_component_widget.dart' show FillAddressComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  String? _departamentocasapisoetcControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for CiudadDropDown widget.
  String? ciudadDropDownValue;
  FormFieldController<String>? ciudadDropDownValueController;
  // State field(s) for ComunaDropDown widget.
  String? comunaDropDownValue;
  FormFieldController<String>? comunaDropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calleControllerValidator = _calleControllerValidator;
    departamentocasapisoetcControllerValidator =
        _departamentocasapisoetcControllerValidator;
  }

  void dispose() {
    calleFocusNode?.dispose();
    calleController?.dispose();

    departamentocasapisoetcFocusNode?.dispose();
    departamentocasapisoetcController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
