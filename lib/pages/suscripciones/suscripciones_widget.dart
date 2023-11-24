import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'suscripciones_model.dart';
export 'suscripciones_model.dart';

class SuscripcionesWidget extends StatefulWidget {
  const SuscripcionesWidget({Key? key}) : super(key: key);

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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.showLoader = true;
      });
      _model.suscripcionesResponse = await UserSuspcriptionsCall.call(
        userId: FFAppState().userSessionUserId,
        token: FFAppState().userSessionToken,
      );
      if ((_model.suscripcionesResponse?.succeeded ?? true)) {
        setState(() {
          _model.addToSubscriptionList(getJsonField(
            (_model.suscripcionesResponse?.jsonBody ?? ''),
            r'''$.data''',
          ));
        });
        if ((_model.vehicleResponse?.succeeded ?? true)) {
          setState(() {
            _model.addToVehicleList(SubscriptionsVehicleCall.data(
              (_model.vehicleResponse?.jsonBody ?? ''),
            ));
          });
          _model.vehicleImageResponse = await UserVehicleImageCall.call(
            brand: SubscriptionsVehicleCall.brans(
              (_model.vehicleResponse?.jsonBody ?? ''),
            ).toString().toString(),
            model: SubscriptionsVehicleCall.model(
              (_model.vehicleResponse?.jsonBody ?? ''),
            ).toString().toString(),
            version: SubscriptionsVehicleCall.version(
              (_model.vehicleResponse?.jsonBody ?? ''),
            ).toString().toString(),
            year: SubscriptionsVehicleCall.year(
              (_model.vehicleResponse?.jsonBody ?? ''),
            ).toString().toString(),
            token: FFAppState().userSessionToken,
          );
          if ((_model.vehicleImageResponse?.succeeded ?? true)) {
            setState(() {
              _model.addToImageList(UserVehicleImageCall.url(
                (_model.vehicleImageResponse?.jsonBody ?? ''),
              ));
            });
          }
        }
        _model.vehicleResponse = await SubscriptionsVehicleCall.call(
          token: FFAppState().userSessionToken,
          vehicleId: UserSuspcriptionsCall.vehicleId(
            (_model.suscripcionesResponse?.jsonBody ?? ''),
          ).toString(),
        );
      }
      setState(() {
        _model.showLoader = false;
      });
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
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 15.0),
              child: Container(
                width: double.infinity,
                height: 79.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 10.0, 7.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '¡Bienvenida Juanita!',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Text(
                          'Aquí encontrarás tus suscripciones de autos',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF131353),
                                fontSize: 12.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) {
                    if (_model.showLoader == true) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.8,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/lottie_animations/loader.json',
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.fill,
                              animate: true,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Builder(
                        builder: (context) {
                          final vehicle = _model.vehicleList.toList();
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: vehicle.length,
                              itemBuilder: (context, vehicleIndex) {
                                final vehicleItem = vehicle[vehicleIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'suscripciones_details',
                                            queryParameters: {
                                              'brand': serializeParam(
                                                getJsonField(
                                                  vehicleItem,
                                                  r'''$.brand''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'model': serializeParam(
                                                getJsonField(
                                                  vehicleItem,
                                                  r'''$.model''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'version': serializeParam(
                                                getJsonField(
                                                  vehicleItem,
                                                  r'''$.version''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'image': serializeParam(
                                                valueOrDefault<String>(
                                                  _model.imageList[vehicleIndex]
                                                      .toString(),
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/connect-car-v1-2i59cm/assets/shbt25lwpskw/car_1.png',
                                                ),
                                                ParamType.String,
                                              ),
                                              'licensePlate': serializeParam(
                                                functions.sortLicencePlate(
                                                    getJsonField(
                                                  vehicleItem,
                                                  r'''$.licensePlate''',
                                                ).toString()),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: Color(0xFF00D880),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            _model.imageList[
                                                                vehicleIndex],
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/connect-car-v1-2i59cm/assets/shbt25lwpskw/car_1.png',
                                                          ),
                                                          width: 220.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            18.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'suscripciones_details',
                                                                      queryParameters:
                                                                          {
                                                                        'brand':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            vehicleItem,
                                                                            r'''$.brand''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'model':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            vehicleItem,
                                                                            r'''$.model''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'version':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            vehicleItem,
                                                                            r'''$.version''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'image':
                                                                            serializeParam(
                                                                          'qww',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    getJsonField(
                                                                      vehicleItem,
                                                                      r'''$.brand''',
                                                                    ).toString(),
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              Color(0xFF131353),
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                  vehicleItem,
                                                                  r'''$.model''',
                                                                ).toString(),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Plus Jakarta Sans',
                                                                      color: Color(
                                                                          0xFF131353),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  functions
                                                                      .sortLicencePlate(
                                                                          getJsonField(
                                                                    vehicleItem,
                                                                    r'''$.licensePlate''',
                                                                  ).toString()),
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        color: Color(
                                                                            0xFF131353),
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    vehicleItem,
                                                                    r'''$.version''',
                                                                  ).toString(),
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        color: Color(
                                                                            0xFF3431E8),
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
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
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
