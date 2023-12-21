import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/car_description/car_description_widget.dart';
import '/pages/subscriptions/payment_history_component/payment_history_component_widget.dart';
import 'suscripciones_details_widget.dart' show SuscripcionesDetailsWidget;
import 'package:flutter/material.dart';

class SuscripcionesDetailsModel
    extends FlutterFlowModel<SuscripcionesDetailsWidget> {
  ///  Local state fields for this page.

  int pagosTabBarIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for car_description component.
  late CarDescriptionModel carDescriptionModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for payment_history_component component.
  late PaymentHistoryComponentModel paymentHistoryComponentModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    carDescriptionModel = createModel(context, () => CarDescriptionModel());
    paymentHistoryComponentModel =
        createModel(context, () => PaymentHistoryComponentModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    carDescriptionModel.dispose();
    tabBarController?.dispose();
    paymentHistoryComponentModel.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
