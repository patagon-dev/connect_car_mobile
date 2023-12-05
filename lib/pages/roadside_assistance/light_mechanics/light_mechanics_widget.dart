import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/roadside_assistance/call_center_other_information/call_center_other_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'light_mechanics_model.dart';
export 'light_mechanics_model.dart';

class LightMechanicsWidget extends StatefulWidget {
  const LightMechanicsWidget({super.key});

  @override
  _LightMechanicsWidgetState createState() => _LightMechanicsWidgetState();
}

class _LightMechanicsWidgetState extends State<LightMechanicsWidget> {
  late LightMechanicsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LightMechanicsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Light_mechanics'});
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
              logFirebaseEvent('LIGHT_MECHANICS_arrow_back_rounded_ICN_O');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Mecánica ligera',
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.callCenterOtherInformationModel,
                updateCallback: () => setState(() {}),
                child: CallCenterOtherInformationWidget(
                  showExtraData: false,
                  onTap: () async {
                    logFirebaseEvent(
                        'LIGHT_MECHANICS_Container_0uf7bvtu_CALLB');
                    logFirebaseEvent(
                        'call_center_other_information_navigate_b');
                    context.safePop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}