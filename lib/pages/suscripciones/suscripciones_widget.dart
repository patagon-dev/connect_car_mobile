import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/subscriptions/car_description/car_description_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'suscripciones_model.dart';
export 'suscripciones_model.dart';

class SuscripcionesWidget extends StatefulWidget {
  const SuscripcionesWidget({super.key});

  @override
  _SuscripcionesWidgetState createState() => _SuscripcionesWidgetState();
}

class _SuscripcionesWidgetState extends State<SuscripcionesWidget> {
  late SuscripcionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuscripcionesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'suscripciones'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SUSCRIPCIONES_suscripciones_ON_INIT_STAT');
      logFirebaseEvent('suscripciones_update_page_state');
      setState(() {
        _model.showLoader = true;
      });
      logFirebaseEvent('suscripciones_backend_call');
      _model.profileResponse = await UserProfileCall.call(
        token: FFAppState().userSessionToken,
        userId: FFAppState().userSessionUserId,
      );
      if ((_model.profileResponse?.succeeded ?? true)) {
        logFirebaseEvent('suscripciones_update_page_state');
        setState(() {
          _model.profileJson = UserProfileCall.data(
            (_model.profileResponse?.jsonBody ?? ''),
          );
        });
      } else {
        if (functions.resetToken(UserProfileCall.error(
          (_model.profileResponse?.jsonBody ?? ''),
        ).toString())) {
          logFirebaseEvent('suscripciones_backend_call');
          _model.resetTokenResponse = await RefreshTokenCall.call(
            refreshToken: FFAppState().refreshToken,
          );
          if ((_model.resetTokenResponse?.succeeded ?? true)) {
            logFirebaseEvent('suscripciones_update_app_state');
            setState(() {
              FFAppState().userSessionToken = RefreshTokenCall.accessToken(
                (_model.resetTokenResponse?.jsonBody ?? ''),
              ).toString();
              FFAppState().refreshToken = RefreshTokenCall.refreshToken(
                (_model.resetTokenResponse?.jsonBody ?? ''),
              ).toString();
            });
          } else {
            logFirebaseEvent('suscripciones_update_app_state');
            setState(() {
              FFAppState().loginPreferences = false;
            });
            logFirebaseEvent('suscripciones_navigate_to');

            context.goNamed('login');

            logFirebaseEvent('suscripciones_update_page_state');
            setState(() {
              _model.showLoader = false;
            });
            return;
          }
        } else {
          logFirebaseEvent('suscripciones_update_app_state');
          setState(() {
            FFAppState().loginPreferences = false;
          });
          logFirebaseEvent('suscripciones_navigate_to');

          context.goNamed('login');

          logFirebaseEvent('suscripciones_update_page_state');
          setState(() {
            _model.showLoader = false;
          });
          return;
        }
      }

      logFirebaseEvent('suscripciones_backend_call');
      _model.suscripcionesResponse = await UserSuspcriptionsCall.call(
        userId: FFAppState().userSessionUserId,
        token: FFAppState().userSessionToken,
      );
      if ((_model.suscripcionesResponse?.succeeded ?? true)) {
        logFirebaseEvent('suscripciones_update_page_state');
        setState(() {
          _model.subscriptionList = getJsonField(
            (_model.suscripcionesResponse?.jsonBody ?? ''),
            r'''$.data''',
            true,
          )!
              .toList()
              .cast<dynamic>();
        });
        logFirebaseEvent('suscripciones_update_app_state');
        FFAppState().userSubscriptionID = UserSuspcriptionsCall.id(
          (_model.suscripcionesResponse?.jsonBody ?? ''),
        ).toString();
        while (_model.current! < _model.subscriptionList.length) {
          logFirebaseEvent('suscripciones_backend_call');
          _model.subscriptionVehicleResponse =
              await SubscriptionsVehicleCall.call(
            vehicleId: getJsonField(
              _model.subscriptionList[_model.current!],
              r'''$.vehicleId''',
            ).toString().toString(),
            token: FFAppState().userSessionToken,
          );
          if ((_model.subscriptionVehicleResponse?.succeeded ?? true)) {
            logFirebaseEvent('suscripciones_update_page_state');
            setState(() {
              _model.addToVehicleList(SubscriptionsVehicleCall.data(
                (_model.subscriptionVehicleResponse?.jsonBody ?? ''),
              ));
            });
            logFirebaseEvent('suscripciones_backend_call');
            _model.vehicleImage = await UserVehicleImageCall.call(
              brand: SubscriptionsVehicleCall.brans(
                (_model.subscriptionVehicleResponse?.jsonBody ?? ''),
              ).toString(),
              model: SubscriptionsVehicleCall.model(
                (_model.subscriptionVehicleResponse?.jsonBody ?? ''),
              ).toString(),
              version: SubscriptionsVehicleCall.version(
                (_model.subscriptionVehicleResponse?.jsonBody ?? ''),
              ).toString(),
              year: SubscriptionsVehicleCall.year(
                (_model.subscriptionVehicleResponse?.jsonBody ?? ''),
              ).toString().toString(),
            );
            logFirebaseEvent('suscripciones_update_page_state');
            setState(() {
              _model
                  .addToVehicleImageList((_model.vehicleImage?.jsonBody ?? ''));
            });
          }
          logFirebaseEvent('suscripciones_update_page_state');
          setState(() {
            _model.current = _model.current! + 1;
          });
        }
      }
      logFirebaseEvent('suscripciones_update_page_state');
      setState(() {
        _model.showLoader = false;
      });
      logFirebaseEvent('suscripciones_request_permissions');
      await requestPermission(notificationsPermission);
    });
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
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_model.showLoader == false)
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 15.0),
                  child: Container(
                    width: double.infinity,
                    height: 79.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 10.0, 7.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: ' ¡Hola ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.black,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    TextSpan(
                                      text: getJsonField(
                                        _model.profileJson,
                                        r'''$.firstname''',
                                      ).toString(),
                                      style: const TextStyle(),
                                    ),
                                    const TextSpan(
                                      text: '!',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                maxLines: 1,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/hello_2.png',
                                    width: 33.0,
                                    height: 33.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Aquí encontrarás tus suscripciones de autos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF131353),
                                    fontSize: 12.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (_model.showLoader == true) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.9,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: custom_widgets
                                    .CustomCircularProgressIndicator(
                                  width: 50.0,
                                  height: 50.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (_model.vehicleList.length == null) {
                      return Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.65,
                          decoration: const BoxDecoration(),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'No data found',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: const Color(0xFF030A0F),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Builder(
                        builder: (context) {
                          final vehicleListData = _model.vehicleList.toList();
                          return SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(vehicleListData.length,
                                  (vehicleListDataIndex) {
                                final vehicleListDataItem =
                                    vehicleListData[vehicleListDataIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 15.0, 10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SUSCRIPCIONES_Container_wvjltmgj_ON_TAP');
                                      logFirebaseEvent(
                                          'car_description_navigate_to');

                                      context.pushNamed(
                                        'suscripciones_details',
                                        queryParameters: {
                                          'brand': serializeParam(
                                            getJsonField(
                                              _model.vehicleList[
                                                  vehicleListDataIndex],
                                              r'''$.brand''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'model': serializeParam(
                                            getJsonField(
                                              _model.vehicleList[
                                                  vehicleListDataIndex],
                                              r'''$.model''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'version': serializeParam(
                                            getJsonField(
                                              _model.vehicleList[
                                                  vehicleListDataIndex],
                                              r'''$.version''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'image': serializeParam(
                                            _model.vehicleImageList[
                                                vehicleListDataIndex],
                                            ParamType.JSON,
                                          ),
                                          'licensePlate': serializeParam(
                                            getJsonField(
                                              _model.vehicleList[
                                                  vehicleListDataIndex],
                                              r'''$.licensePlate''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                          'subscriptionID': serializeParam(
                                            getJsonField(
                                              _model.subscriptionList[
                                                  vehicleListDataIndex],
                                              r'''$.id''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );

                                      logFirebaseEvent(
                                          'car_description_update_app_state');
                                      setState(() {
                                        FFAppState().selectedCarModel =
                                            SelectedCarDetailModelStruct(
                                          brand: getJsonField(
                                            _model.vehicleList[
                                                vehicleListDataIndex],
                                            r'''$.brand''',
                                          ).toString(),
                                          model: getJsonField(
                                            _model.vehicleList[
                                                vehicleListDataIndex],
                                            r'''$.model''',
                                          ).toString(),
                                          version: getJsonField(
                                            _model.vehicleList[
                                                vehicleListDataIndex],
                                            r'''$.version''',
                                          ).toString(),
                                          image: _model.vehicleImageList[
                                                  vehicleListDataIndex]
                                              .toString(),
                                          licensePlate: getJsonField(
                                            _model.vehicleList[
                                                vehicleListDataIndex],
                                            r'''$.licensePlate''',
                                          ).toString(),
                                          year: getJsonField(
                                            _model.vehicleList[
                                                vehicleListDataIndex],
                                            r'''$.year''',
                                          ).toString(),
                                        );
                                      });
                                    },
                                    child: wrapWithModel(
                                      model:
                                          _model.carDescriptionModels.getModel(
                                        valueOrDefault<String>(
                                          _model.vehicleImageList[
                                                  vehicleListDataIndex]
                                              .toString(),
                                          'def',
                                        ),
                                        vehicleListDataIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      child: CarDescriptionWidget(
                                        key: Key(
                                          'Keywvj_${valueOrDefault<String>(
                                            _model.vehicleImageList[
                                                    vehicleListDataIndex]
                                                .toString(),
                                            'def',
                                          )}',
                                        ),
                                        brand: getJsonField(
                                          _model.vehicleList[
                                              vehicleListDataIndex],
                                          r'''$.brand''',
                                        ).toString(),
                                        model: getJsonField(
                                          _model.vehicleList[
                                              vehicleListDataIndex],
                                          r'''$.model''',
                                        ).toString(),
                                        plateNumber: getJsonField(
                                          _model.vehicleList[
                                              vehicleListDataIndex],
                                          r'''$.licensePlate''',
                                        ).toString(),
                                        version: getJsonField(
                                          _model.vehicleList[
                                              vehicleListDataIndex],
                                          r'''$.version''',
                                        ).toString(),
                                        showMoreDetails: false,
                                        image: _model.vehicleImageList[
                                            vehicleListDataIndex],
                                      ),
                                    ),
                                  ),
                                );
                              }).addToEnd(const SizedBox(height: 50.0)),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: wrapWithModel(
              model: _model.navBarModel,
              updateCallback: () => setState(() {}),
              child: const NavBarWidget(
                page: 'sub',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
