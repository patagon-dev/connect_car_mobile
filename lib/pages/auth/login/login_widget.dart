import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'login'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_PAGE_login_ON_INIT_STATE');
      if ((FFAppState().userSessionToken != '') &&
          (FFAppState().loginPreferences == true)) {
        logFirebaseEvent('login_navigate_to');

        context.pushNamed('suscripciones');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 95.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/connect_car_logo.png',
                      width: 300.0,
                      height: 80.0,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                  child: Text(
                    'Bienvenido a tu sesión privada',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: const Color(0xFF131353),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 340.0,
                  child: custom_widgets.SignInForm(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 340.0,
                    onTap: () async {
                      logFirebaseEvent(
                          'LOGIN_PAGE_Container_fip7f4yx_CALLBACK');
                      logFirebaseEvent('SignInForm_custom_action');
                      _model.msg = await actions.login(
                        context,
                        FFAppState().signInEmail,
                        FFAppState().signInPassword,
                      );

                      setState(() {});
                    },
                    navigate: () async {
                      logFirebaseEvent(
                          'LOGIN_PAGE_Container_fip7f4yx_CALLBACK');
                      logFirebaseEvent('SignInForm_navigate_to');

                      context.goNamed('reset_password');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
