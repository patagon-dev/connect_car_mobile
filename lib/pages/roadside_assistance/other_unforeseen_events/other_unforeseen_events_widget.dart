import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/roadside_assistance/call_center_other_information/call_center_other_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'other_unforeseen_events_model.dart';
export 'other_unforeseen_events_model.dart';

class OtherUnforeseenEventsWidget extends StatefulWidget {
  const OtherUnforeseenEventsWidget({super.key});

  @override
  _OtherUnforeseenEventsWidgetState createState() =>
      _OtherUnforeseenEventsWidgetState();
}

class _OtherUnforeseenEventsWidgetState
    extends State<OtherUnforeseenEventsWidget> {
  late OtherUnforeseenEventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtherUnforeseenEventsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'other_unforeseen_events'});
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
              logFirebaseEvent('OTHER_UNFORESEEN_EVENTS_arrow_back_round');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Otros imprevistos',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                  color: const Color(0xFF131353),
                  fontSize: 16.0,
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
                children: [
                  wrapWithModel(
                    model: _model.callCenterOtherInformationModel,
                    updateCallback: () => setState(() {}),
                    child: CallCenterOtherInformationWidget(
                      claimNotificationDescription:
                          'Ante un problema no programado (como panne de combustible, descarga de batería, cerrajero o un pinchazo), debes dar aviso a la aseguradora SURA a través de uno de los siguientes canales: ',
                      showExtraData: true,
                      onTap: () async {
                        logFirebaseEvent(
                            'OTHER_UNFORESEEN_EVENTS_Container_gje081');
                        logFirebaseEvent(
                            'call_center_other_information_navigate_b');
                        context.safePop();
                      },
                    ),
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
