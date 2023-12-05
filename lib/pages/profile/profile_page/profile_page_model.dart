import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_button/custom_button_widget.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  Local state fields for this page.

  bool hasProfileData = true;

  bool profileLoader = false;

  dynamic profileJson;

  bool emailSentLoader = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (User Info)] action in profile_page widget.
  ApiCallResponse? profileResponse;
  // Stores action output result for [Backend Call - API (refresh token)] action in profile_page widget.
  ApiCallResponse? refreshTokenResponse;
  // Stores action output result for [Backend Call - API (user identity profiles)] action in profile_page widget.
  ApiCallResponse? userIdentityResponse;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for custom_button component.
  late CustomButtonModel customButtonModel1;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El Email es requerido';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email inválido';
    }
    return null;
  }

  // Model for custom_button component.
  late CustomButtonModel customButtonModel2;
  // Stores action output result for [Backend Call - API (User Credentials Reset)] action in custom_button widget.
  ApiCallResponse? sendLinkResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customButtonModel1 = createModel(context, () => CustomButtonModel());
    emailControllerValidator = _emailControllerValidator;
    customButtonModel2 = createModel(context, () => CustomButtonModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    customButtonModel1.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    customButtonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
