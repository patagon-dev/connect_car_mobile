import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'fill_address_component_widget.dart' show FillAddressComponentWidget;
import 'package:flutter/material.dart';

class FillAddressComponentModel
    extends FlutterFlowModel<FillAddressComponentWidget> {
  ///  Local state fields for this component.

  List<CommunesModelStruct> communeList = [];
  void addToCommuneList(CommunesModelStruct item) => communeList.add(item);
  void removeFromCommuneList(CommunesModelStruct item) =>
      communeList.remove(item);
  void removeAtIndexFromCommuneList(int index) => communeList.removeAt(index);
  void insertAtIndexInCommuneList(int index, CommunesModelStruct item) =>
      communeList.insert(index, item);
  void updateCommuneListAtIndex(
          int index, Function(CommunesModelStruct) updateFn) =>
      communeList[index] = updateFn(communeList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - communiesList] action in fill_address_component widget.
  List<CommunesModelStruct>? communesList;
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
  // Stores action output result for [Custom Action - communiesList] action in DropDown widget.
  List<CommunesModelStruct>? communiesListData;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    calleControllerValidator = _calleControllerValidator;
  }

  @override
  void dispose() {
    calleFocusNode?.dispose();
    calleController?.dispose();

    departamentocasapisoetcFocusNode?.dispose();
    departamentocasapisoetcController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
