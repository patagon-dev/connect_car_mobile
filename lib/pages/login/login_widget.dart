import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

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
      body: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 95.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('car_crash_form');
                    },
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                  child: Text(
                    'Bienvenido a tu sesión privada',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF131353),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 340.0,
                  child: custom_widgets.SignInForm(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 340.0,
                    onTap: () async {
                      setState(() {
                        FFAppState().authLoader = true;
                      });
                      _model.signInApiResponse = await UserLoginCall.call(
                        email: FFAppState().signInEmail,
                        password: FFAppState().signInPassword,
                      );
                      if ((_model.signInApiResponse?.succeeded ?? true)) {
                        if (UserLoginCall.token(
                                  (_model.signInApiResponse?.jsonBody ?? ''),
                                ).toString() !=
                                null &&
                            UserLoginCall.token(
                                  (_model.signInApiResponse?.jsonBody ?? ''),
                                ).toString() !=
                                '') {
                          setState(() {
                            FFAppState().userSessionToken = UserLoginCall.token(
                              (_model.signInApiResponse?.jsonBody ?? ''),
                            ).toString();
                            FFAppState().userSessionUserId =
                                UserLoginCall.userId(
                              (_model.signInApiResponse?.jsonBody ?? ''),
                            ).toString();
                            FFAppState().refreshToken =
                                UserLoginCall.refreshToken(
                              (_model.signInApiResponse?.jsonBody ?? ''),
                            ).toString();
                          });

                          context.goNamed('suscripciones');

                          _model.signInTimer = InstantTimer.periodic(
                            duration: Duration(milliseconds: 3600000),
                            callback: (timer) async {
                              _model.refreshTokenApiResponse =
                                  await RefreshTokenCall.call(
                                token: FFAppState().refreshToken,
                              );
                              if ((_model.refreshTokenApiResponse?.succeeded ??
                                  true)) {
                                setState(() {
                                  FFAppState().userSessionToken =
                                      RefreshTokenCall.accessToken(
                                    (_model.refreshTokenApiResponse?.jsonBody ??
                                        ''),
                                  ).toString();
                                  FFAppState().refreshToken =
                                      RefreshTokenCall.refreshToken(
                                    (_model.refreshTokenApiResponse?.jsonBody ??
                                        ''),
                                  ).toString();
                                });
                              } else {
                                context.pushNamed('login');

                                setState(() {
                                  FFAppState().refreshToken = '';
                                  FFAppState().userSessionToken = '';
                                });
                                _model.signInTimer?.cancel();
                              }
                            },
                            startImmediately: false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Email o Contraseña inválido 1',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Color(0xFFFF0000),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Email o Contraseña inválido',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0xFFFF0000),
                          ),
                        );
                      }

                      setState(() {
                        FFAppState().authLoader = false;
                      });

                      setState(() {});
                    },
                    navigate: () async {
                      context.goNamed('reset_password');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
