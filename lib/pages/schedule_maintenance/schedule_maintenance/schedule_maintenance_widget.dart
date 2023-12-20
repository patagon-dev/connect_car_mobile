import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/schedule_maintenance/fill_address_component/fill_address_component_widget.dart';
import '/pages/subscriptions/car_description/car_description_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'schedule_maintenance_model.dart';
export 'schedule_maintenance_model.dart';

class ScheduleMaintenanceWidget extends StatefulWidget {
  const ScheduleMaintenanceWidget({
    super.key,
    this.brand,
    this.model,
    this.licensePlate,
    this.version,
    this.carimge,
  });

  final String? brand;
  final String? model;
  final String? licensePlate;
  final String? version;
  final dynamic carimge;

  @override
  _ScheduleMaintenanceWidgetState createState() =>
      _ScheduleMaintenanceWidgetState();
}

class _ScheduleMaintenanceWidgetState extends State<ScheduleMaintenanceWidget> {
  late ScheduleMaintenanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleMaintenanceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'schedule_maintenance'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SCHEDULE_MAINTENANCE_schedule_maintenanc');
      logFirebaseEvent('schedule_maintenance_backend_call');
      _model.userAddressResponse =
          await ConnectCarApiGroup.getUserAddressCall.call(
        userID: FFAppState().userSessionUserId,
        authToken: FFAppState().userSessionToken,
      );
      if ((_model.userAddressResponse?.succeeded ?? true)) {
        logFirebaseEvent('schedule_maintenance_update_page_state');
        setState(() {
          _model.addressModel = AddressModelStruct(
            calle: ConnectCarApiGroup.getUserAddressCall
                .addressStreet(
                  (_model.userAddressResponse?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            departament: '',
            ciudad: ConnectCarApiGroup.getUserAddressCall
                .addressCity(
                  (_model.userAddressResponse?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            comuna: ConnectCarApiGroup.getUserAddressCall
                .addressCommune(
                  (_model.userAddressResponse?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
            selectedRegion: ConnectCarApiGroup.getUserAddressCall
                .addressRegion(
                  (_model.userAddressResponse?.jsonBody ?? ''),
                )
                .toString()
                .toString(),
          );
          _model.isApicallSuccess = true;
        });
      } else {
        logFirebaseEvent('schedule_maintenance_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              valueOrDefault<String>(
                getJsonField(
                  (_model.userAddressResponse?.jsonBody ?? ''),
                  r'''$.error''',
                ).toString().toString(),
                'N/A',
              ),
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        logFirebaseEvent('schedule_maintenance_update_page_state');
        setState(() {
          _model.isApicallSuccess = false;
        });
      }
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              logFirebaseEvent('SCHEDULE_MAINTENANCE_arrow_back_rounded_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Agendamiento mantención',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                  color: const Color(0xFF131353),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).displaySmallFamily),
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) {
                      if (valueOrDefault<bool>(
                        _model.isApicallSuccess,
                        false,
                      )) {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.82,
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                if (FFAppState().currentTabIndex == 0) {
                                  return ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 11.0, 15.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 30.0, 0.0, 30.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .carDescriptionModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: CarDescriptionWidget(
                                                      brand: widget.brand,
                                                      model: widget.model,
                                                      plateNumber:
                                                          widget.licensePlate,
                                                      version: widget.version!,
                                                      showMoreDetails: false,
                                                      image: widget.carimge,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    'Tipo de mantención',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                ),
                                                Text(
                                                  'Mantención por kilometraje (10.000 kms)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                                          0.0, 30.0, 0.0, 0.0),
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
                                                                    13.0),
                                                        child: Text(
                                                          'Dirección de retiro del auto',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      22.0,
                                                                      20.0,
                                                                      22.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/location_blue.svg',
                                                                  width: 25.0,
                                                                  height: 25.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Dirección',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          _model
                                                                              .addressModel!
                                                                              .calle,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          _model
                                                                              .addressModel!
                                                                              .departament,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                fontSize: 13.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          '${_model.addressModel?.comuna}, ${_model.addressModel?.ciudad}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                fontSize: 13.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
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
                                                                    logFirebaseEvent(
                                                                        'SCHEDULE_MAINTENANCE_Text_0a800uiv_ON_TA');
                                                                    logFirebaseEvent(
                                                                        'Text_bottom_sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          const Color(
                                                                              0xCBD9D9D9),
                                                                      isDismissible:
                                                                          false,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                FillAddressComponentWidget(
                                                                              addressModel: _model.addressModel,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(() =>
                                                                            _model.addressResult =
                                                                                value));

                                                                    logFirebaseEvent(
                                                                        'Text_update_page_state');
                                                                    setState(
                                                                        () {
                                                                      _model.addressModel =
                                                                          _model
                                                                              .addressResult;
                                                                    });

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Text(
                                                                    'Cambiar',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 30.0, 0.0, 0.0),
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
                                                                    13.0),
                                                        child: Text(
                                                          'Selecciona una fecha de retiro del auto',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    13.0),
                                                        child: Text(
                                                          '*Se debe agendar con 7 días de anticipación\n*La hora de retiro es entre las 8:30 - 12:00 hrs, cualquier día de los seleccionados. ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    30.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final dateData =
                                                                functions
                                                                    .dateLists(
                                                                        7, 5)
                                                                    .toList();
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  dateData
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  dateDataIndex) {
                                                                final dateDataItem =
                                                                    dateData[
                                                                        dateDataIndex];
                                                                return Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SCHEDULE_MAINTENANCE_Container_wx8av0hc_');
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      setState(
                                                                          () {
                                                                        _model.selectedDate =
                                                                            dateTimeFormat(
                                                                          'MMMMEEEEd',
                                                                          dateDataItem,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        );
                                                                        _model.selectedDateIndex =
                                                                            dateDataIndex;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: dateDataIndex ==
                                                                                _model.selectedDateIndex
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(50.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            56.0,
                                                                            11.0,
                                                                            56.0,
                                                                            11.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Align(
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  dateTimeFormat(
                                                                                    'MMMMEEEEd',
                                                                                    dateDataItem,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        color: dateDataIndex == _model.selectedDateIndex ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 0.0, 15.0,
                                                          35.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'SCHEDULE_MAINTENANCE_ENVIAR_SOLICITUD_BT');
                                                      var shouldSetState =
                                                          false;
                                                      if (_model.selectedDate !=
                                                              null &&
                                                          _model.selectedDate !=
                                                              '') {
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        _model.createUserResponse =
                                                            await CarCrashGroup
                                                                .createZamadUserCall
                                                                .call(
                                                          userEmail: FFAppState()
                                                              .emailPersistent,
                                                          roles: 'Customer',
                                                          authorizationToken:
                                                              'Token MfaSE3CHlbT58A3czVPM7E8mn3UhNlcxfTQ6OMcvixnLAdhnWO2rXooPOq0n7UqJ',
                                                        );
                                                        shouldSetState = true;
                                                        if (!(CarCrashGroup
                                                                .createZamadUserCall
                                                                .customerID(
                                                              (_model.createUserResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) !=
                                                            null)) {
                                                          logFirebaseEvent(
                                                              'Button_custom_action');
                                                          _model.checkUserIsExist =
                                                              await actions
                                                                  .checkUserExistInZamad(
                                                            CarCrashGroup
                                                                .createZamadUserCall
                                                                .error(
                                                                  (_model.createUserResponse
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                                .toString(),
                                                          );
                                                          shouldSetState =
                                                              true;
                                                          if (!_model
                                                              .checkUserIsExist!) {
                                                            logFirebaseEvent(
                                                                'Button_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Ocurrió un error. Por favor reintentar.',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                              ),
                                                            );
                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                            return;
                                                          }
                                                        }
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        _model.scheduleRequestResponse =
                                                            await CarCrashGroup
                                                                .scheduleRequestInZamadCall
                                                                .call(
                                                          title:
                                                              'Agendamiento por ${FFAppState().emailPersistent}',
                                                          group: 'Users',
                                                          customerId:
                                                              'guess:${FFAppState().emailPersistent}',
                                                          email: FFAppState()
                                                              .emailPersistent,
                                                          authTokenBearer:
                                                              'Bearer MfaSE3CHlbT58A3czVPM7E8mn3UhNlcxfTQ6OMcvixnLAdhnWO2rXooPOq0n7UqJ',
                                                          articleJson: functions
                                                              .setJsonForSendindSceduleMail(
                                                                  'Agendamiento',
                                                                  FFAppState()
                                                                      .emailPersistent,
                                                                  FFAppState()
                                                                      .emailPersistent,
                                                                  'Schedule event date ${_model.selectedDate} on address: ${'Street ${_model.addressModel?.calle}, ${_model.addressModel?.departament},${_model.addressModel?.comuna}, ${_model.addressModel?.ciudad}'} Vehicle: ${'${widget.brand} ${widget.model} , Patente ${widget.licensePlate}'}',
                                                                  'web',
                                                                  false,
                                                                  'text/html'),
                                                        );
                                                        shouldSetState = true;
                                                        if (CarCrashGroup
                                                                .scheduleRequestInZamadCall
                                                                .ticketID(
                                                              (_model.scheduleRequestResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) !=
                                                            null) {
                                                          logFirebaseEvent(
                                                              'Button_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Su solicitud ha sido ingresada correctamente.',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.goNamed(
                                                            'maintenance_scheduling',
                                                            queryParameters: {
                                                              'scheduleDate':
                                                                  serializeParam(
                                                                _model
                                                                    .selectedDate,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Button_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Ocurrió un error inesperado.',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                            ),
                                                          );
                                                        }
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Debe seleccionar una fecha.',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }

                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                    },
                                                    text: 'Enviar solicitud',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0xFF131353),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 40.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.8,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'profile container',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        );
                      } else if (!valueOrDefault<bool>(
                        _model.isApicallSuccess,
                        false,
                      )) {
                        return Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child:
                                custom_widgets.CustomCircularProgressIndicator(
                              width: 50.0,
                              height: 50.0,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      } else {
                        return Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Text(
                              'Ops Somthing went wrong with api.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => setState(() {}),
                child: const NavBarWidget(
                  page: 'no',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
