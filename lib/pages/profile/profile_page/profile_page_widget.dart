import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/roadside_assistance/custom_button/custom_button_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget>
    with TickerProviderStateMixin {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'profile_page'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_profile_page_ON_INIT_STATE');
      logFirebaseEvent('profile_page_update_page_state');
      setState(() {
        _model.profileLoader = true;
      });
      logFirebaseEvent('profile_page_backend_call');
      _model.profileResponse = await UserProfileCall.call(
        token: FFAppState().userSessionToken,
        userId: FFAppState().userSessionUserId,
      );
      logFirebaseEvent('profile_page_backend_call');
      _model.userIdentityResponse = await UserIdentityProfilesCall.call(
        userId: FFAppState().userSessionUserId,
        token: FFAppState().userSessionToken,
      );
      if (!((_model.profileResponse?.succeeded ?? true) ||
          (_model.userIdentityResponse?.succeeded ?? true))) {
        if (functions.resetToken(UserProfileCall.error(
          (_model.profileResponse?.jsonBody ?? ''),
        ).toString())) {
          logFirebaseEvent('profile_page_backend_call');
          _model.resetTokenResponse = await RefreshTokenCall.call(
            refreshToken: FFAppState().refreshToken,
          );
          if ((_model.resetTokenResponse?.succeeded ?? true)) {
            logFirebaseEvent('profile_page_update_app_state');
            setState(() {
              FFAppState().userSessionToken = RefreshTokenCall.accessToken(
                (_model.resetTokenResponse?.jsonBody ?? ''),
              ).toString();
              FFAppState().refreshToken = RefreshTokenCall.refreshToken(
                (_model.resetTokenResponse?.jsonBody ?? ''),
              ).toString();
            });
          } else {
            logFirebaseEvent('profile_page_update_app_state');
            setState(() {
              FFAppState().loginPreferences = false;
            });
            logFirebaseEvent('profile_page_update_page_state');
            setState(() {
              _model.profileLoader = false;
            });
            logFirebaseEvent('profile_page_navigate_to');

            context.goNamed('login');

            return;
          }
        } else {
          logFirebaseEvent('profile_page_update_app_state');
          setState(() {
            FFAppState().loginPreferences = false;
          });
          logFirebaseEvent('profile_page_update_page_state');
          setState(() {
            _model.profileLoader = false;
          });
          logFirebaseEvent('profile_page_navigate_to');

          context.goNamed('login');

          return;
        }
      }
      logFirebaseEvent('profile_page_update_page_state');
      setState(() {
        _model.profileLoader = false;
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Mi Perfil',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Plus Jakarta Sans',
                color: const Color(0xFF131353),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    FlutterFlowTheme.of(context).headlineMediumFamily),
              ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Builder(
                builder: (context) {
                  if (_model.profileLoader == true) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.9,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child:
                                custom_widgets.CustomCircularProgressIndicator(
                              width: 50.0,
                              height: 50.0,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        width: double.infinity,
                        height: 470.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: const Alignment(-1.0, 0),
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: const Color(0xFF131353),
                                      unselectedLabelColor: const Color(0xFF979797),
                                      labelPadding: const EdgeInsets.all(10.0),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      unselectedLabelStyle: FlutterFlowTheme.of(
                                              context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      tabs: const [
                                        Tab(
                                          text: 'Información Personal',
                                        ),
                                        Tab(
                                          text: 'Contraseña',
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    5.0),
                                                            child: Text(
                                                              'Nombre',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: const Color(
                                                                        0xFF131353),
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    5.0),
                                                            child: Text(
                                                              UserProfileCall
                                                                  .firstName(
                                                                (_model.profileResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString(),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: const Color(
                                                                        0xFF131353),
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    thickness: 1.0,
                                                    color: Color(0xFFE2E2E2),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      5.0),
                                                          child: Text(
                                                            'Apellido',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFF131353),
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      5.0),
                                                          child: Text(
                                                            UserProfileCall
                                                                .lastName(
                                                              (_model.profileResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString(),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFF131353),
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Divider(
                                                    thickness: 1.0,
                                                    color: Color(0xFFE2E2E2),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  5.0),
                                                          child: Text(
                                                            'Email',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFF131353),
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  5.0),
                                                          child: Text(
                                                            UserProfileCall
                                                                .email(
                                                              (_model.profileResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString(),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFF131353),
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Divider(
                                                    thickness: 1.0,
                                                    color: Color(0xFFE2E2E2),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  5.0),
                                                          child: Text(
                                                            'Teléfono',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFF131353),
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  5.0),
                                                          child: Text(
                                                            UserIdentityProfilesCall
                                                                .phone(
                                                              (_model.userIdentityResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString(),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFF131353),
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 50.0, 0.0, 0.0),
                                                child: wrapWithModel(
                                                  model:
                                                      _model.customButtonModel1,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: CustomButtonWidget(
                                                    title: 'Cerrar sesión',
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'PROFILE_Container_frnaitm0_CALLBACK');
                                                      logFirebaseEvent(
                                                          'custom_button_update_app_state');
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .userSessionToken = '';
                                                        FFAppState()
                                                            .userSessionUserId = '';
                                                        FFAppState()
                                                                .loginPreferences =
                                                            false;
                                                      });
                                                      logFirebaseEvent(
                                                          'custom_button_navigate_to');

                                                      context.goNamed('login');
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 35.0, 10.0, 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Cambio de contraseña',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              const Color(0xFF3330E8),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: Text(
                                                  'Te llegará un link a tu email, donde podrás crear tu nueva contraseña.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            const Color(0xFF131353),
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Form(
                                                    key: _model.formKey,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .disabled,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  15.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Text(
                                                              'Email',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: const Color(
                                                                        0xFF131353),
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                .emailController,
                                                            focusNode: _model
                                                                .emailFocusNode,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              alignLabelWithHint:
                                                                  false,
                                                              errorStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0xFF3330E8),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0xFF3330E8),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFF474747),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            cursorColor:
                                                                Colors.black,
                                                            validator: _model
                                                                .emailControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        15.0,
                                                                        0.0,
                                                                        15.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xFFD4E0FD),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            15.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Importante',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: const Color(0xFF3330E8),
                                                                              fontSize: 13.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'El email enviado expirará dentro de una hora.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: const Color(0xFF3330E8),
                                                                              fontSize: 13.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          wrapWithModel(
                                                            model: _model
                                                                .customButtonModel2,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                CustomButtonWidget(
                                                              title:
                                                                  'Enviar link',
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'PROFILE_Container_f5fqpwp9_CALLBACK');
                                                                var shouldSetState =
                                                                    false;
                                                                logFirebaseEvent(
                                                                    'custom_button_validate_form');
                                                                if (_model.formKey
                                                                            .currentState ==
                                                                        null ||
                                                                    !_model
                                                                        .formKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                  return;
                                                                }
                                                                logFirebaseEvent(
                                                                    'custom_button_backend_call');
                                                                _model.sendLinkResponse =
                                                                    await UserCredentialsResetCall
                                                                        .call(
                                                                  email: _model
                                                                      .emailController
                                                                      .text,
                                                                  token: FFAppState()
                                                                      .userSessionToken,
                                                                );
                                                                shouldSetState =
                                                                    true;
                                                                if ((_model
                                                                        .sendLinkResponse
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  if (getJsonField(
                                                                        (_model.sendLinkResponse?.jsonBody ??
                                                                            ''),
                                                                        r'''$.data''',
                                                                      ) !=
                                                                      null) {
                                                                    logFirebaseEvent(
                                                                        'custom_button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      const SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Link resend successfully',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 3000),
                                                                        backgroundColor:
                                                                            Color(0xFF008000),
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'custom_button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      const SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Email inválido',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 3000),
                                                                        backgroundColor:
                                                                            Color(0xFFFF0000),
                                                                      ),
                                                                    );
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'custom_button_show_snack_bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    const SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Email inválido',
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              3000),
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xFFFF0000),
                                                                    ),
                                                                  );
                                                                  if (functions
                                                                      .resetToken(
                                                                          UserProfileCall
                                                                              .error(
                                                                    (_model.profileResponse
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString())) {
                                                                    logFirebaseEvent(
                                                                        'custom_button_backend_call');
                                                                    _model.resetTokenRespons =
                                                                        await RefreshTokenCall
                                                                            .call(
                                                                      refreshToken:
                                                                          FFAppState()
                                                                              .refreshToken,
                                                                    );
                                                                    shouldSetState =
                                                                        true;
                                                                    if ((_model
                                                                            .resetTokenRespons
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      logFirebaseEvent(
                                                                          'custom_button_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().userSessionToken =
                                                                            FFAppState().userSessionToken;
                                                                        FFAppState().refreshToken =
                                                                            FFAppState().refreshToken;
                                                                      });
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'custom_button_update_app_state');
                                                                      setState(
                                                                          () {
                                                                        FFAppState().loginPreferences =
                                                                            false;
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'custom_button_update_page_state');
                                                                      logFirebaseEvent(
                                                                          'custom_button_navigate_to');
                                                                      if (shouldSetState) {
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                      return;
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'custom_button_update_app_state');
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .loginPreferences =
                                                                          false;
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'custom_button_update_page_state');
                                                                    setState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'custom_button_navigate_to');

                                                                    context.goNamed(
                                                                        'login');

                                                                    if (shouldSetState) {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                    return;
                                                                  }
                                                                }

                                                                if (shouldSetState) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: wrapWithModel(
              model: _model.navBarModel,
              updateCallback: () => setState(() {}),
              child: const NavBarWidget(
                page: 'profil',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
