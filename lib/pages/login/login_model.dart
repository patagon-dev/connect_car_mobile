import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  bool showError = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (User Login)] action in SignInForm widget.
  ApiCallResponse? signInApiResponse;
  InstantTimer? signInTimer;
  // Stores action output result for [Backend Call - API (refresh token)] action in SignInForm widget.
  ApiCallResponse? refreshTokenApiResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    signInTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
