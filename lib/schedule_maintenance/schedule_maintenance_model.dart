import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/pages/car_detail_component/car_detail_component_widget.dart';
import '/pages/fill_address_component/fill_address_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'schedule_maintenance_widget.dart' show ScheduleMaintenanceWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScheduleMaintenanceModel
    extends FlutterFlowModel<ScheduleMaintenanceWidget> {
  ///  Local state fields for this page.

  int? selectedDateIndex;

  AddressModelStruct? addressModel;
  void updateAddressModelStruct(Function(AddressModelStruct) updateFn) =>
      updateFn(addressModel ??= AddressModelStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for car_detail_Component component.
  late CarDetailComponentModel carDetailComponentModel;
  // Stores action output result for [Bottom Sheet - fill_address_component] action in Text widget.
  AddressModelStruct? addressResult;
  // Model for bottom_nav_bar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    carDetailComponentModel =
        createModel(context, () => CarDetailComponentModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    carDetailComponentModel.dispose();
    bottomNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
