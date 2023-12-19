import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reset_password_model.dart';
export 'reset_password_model.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({super.key});

  @override
  _ResetPasswordWidgetState createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  late ResetPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPasswordModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'reset_password'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 55.0,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF49454F),
            size: 25.0,
          ),
          onPressed: () async {
            logFirebaseEvent('RESET_PASSWORD_arrow_back_rounded_ICN_ON');
            logFirebaseEvent('IconButton_navigate_to');

            context.pushNamed('login');
          },
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/connect_car_logo.png',
                            width: 300.0,
                            height: 80.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: Text(
                            '¿No recuerdas tu contraseña?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF131353),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: Text(
                            'Ingresa tu email y te enviaremos un link para que vuelvas a entrar en tu cuenta.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF131353),
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 350.0,
                          child: custom_widgets.ResetPasswordForm(
                            width: double.infinity,
                            height: 350.0,
                            onTap: () async {
                              logFirebaseEvent(
                                  'RESET_PASSWORD_Container_rq5u30ro_CALLBA');
                              logFirebaseEvent(
                                  'ResetPasswordForm_update_app_state');
                              setState(() {
                                FFAppState().authLoader = true;
                              });
                              logFirebaseEvent(
                                  'ResetPasswordForm_backend_call');
                              _model.resetPasswordResponse =
                                  await UserCredentialsResetCall.call(
                                token: FFAppState().userSessionToken,
                                email: FFAppState().resetEmail,
                              );
                              if ((_model.resetPasswordResponse?.succeeded ??
                                  true)) {
                                if (getJsonField(
                                      (_model.resetPasswordResponse?.jsonBody ??
                                          ''),
                                      r'''$.data''',
                                    ) ==
                                    null) {
                                  logFirebaseEvent(
                                      'ResetPasswordForm_navigate_to');

                                  context
                                      .pushNamed('reset_password_verification');
                                }
                              }
                              logFirebaseEvent(
                                  'ResetPasswordForm_update_app_state');
                              setState(() {
                                FFAppState().authLoader = false;
                              });

                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
