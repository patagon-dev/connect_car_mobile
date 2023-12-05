import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_comp_model.dart';
export 'dropdown_comp_model.dart';

class DropdownCompWidget extends StatefulWidget {
  const DropdownCompWidget({super.key});

  @override
  _DropdownCompWidgetState createState() => _DropdownCompWidgetState();
}

class _DropdownCompWidgetState extends State<DropdownCompWidget> {
  late DropdownCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowDropDown<String>(
      controller: _model.dropDownFourValueController ??=
          FormFieldController<String>(null),
      options: const ['Si', 'No'],
      onChanged: (val) async {
        setState(() => _model.dropDownFourValue = val);
        logFirebaseEvent('DROPDOWN_dropDownFour_ON_FORM_WIDGET_SEL');
        logFirebaseEvent('dropDownFour_update_app_state');
        _model.updatePage(() {
          FFAppState().dropdown4 = _model.dropDownFourValue!;
        });
      },
      width: double.infinity,
      height: 50.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Plus Jakarta Sans',
            color: FlutterFlowTheme.of(context).textColor,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
          ),
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).textFieldColor,
      elevation: 2.0,
      borderColor: const Color(0x7457636C),
      borderWidth: 1.0,
      borderRadius: 8.0,
      margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
      hidesUnderline: true,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
