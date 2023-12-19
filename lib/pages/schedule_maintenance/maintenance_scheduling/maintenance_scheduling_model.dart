import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'maintenance_scheduling_widget.dart' show MaintenanceSchedulingWidget;
import 'package:flutter/material.dart';

class MaintenanceSchedulingModel
    extends FlutterFlowModel<MaintenanceSchedulingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for bottom_nav_bar component.
  late BottomNavBarModel bottomNavBarModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bottomNavBarModel.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
