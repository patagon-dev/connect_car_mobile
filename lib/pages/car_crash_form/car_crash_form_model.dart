import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'car_crash_form_widget.dart' show CarCrashFormWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarCrashFormModel extends FlutterFlowModel<CarCrashFormWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  DateTime? datePicked1;
  // State field(s) for Nombredelapersonaqueibaconduciendo widget.
  FocusNode? nombredelapersonaqueibaconduciendoFocusNode;
  TextEditingController? nombredelapersonaqueibaconduciendoController;
  String? Function(BuildContext, String?)?
      nombredelapersonaqueibaconduciendoControllerValidator;
  String? _nombredelapersonaqueibaconduciendoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for RutoPasaportedelapersonaqueibaconduciendo widget.
  FocusNode? rutoPasaportedelapersonaqueibaconduciendoFocusNode;
  TextEditingController? rutoPasaportedelapersonaqueibaconduciendoController;
  String? Function(BuildContext, String?)?
      rutoPasaportedelapersonaqueibaconduciendoControllerValidator;
  String? _rutoPasaportedelapersonaqueibaconduciendoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Nacionalidad widget.
  FocusNode? nacionalidadFocusNode;
  TextEditingController? nacionalidadController;
  String? Function(BuildContext, String?)? nacionalidadControllerValidator;
  String? _nacionalidadControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for DireccinCalleynmerodelapersonaqueibaconduciendo widget.
  FocusNode? direccinCalleynmerodelapersonaqueibaconduciendoFocusNode;
  TextEditingController?
      direccinCalleynmerodelapersonaqueibaconduciendoController;
  String? Function(BuildContext, String?)?
      direccinCalleynmerodelapersonaqueibaconduciendoControllerValidator;
  String? _direccinCalleynmerodelapersonaqueibaconduciendoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Comunadelapersonaqueibaconduciendo widget.
  FocusNode? comunadelapersonaqueibaconduciendoFocusNode;
  TextEditingController? comunadelapersonaqueibaconduciendoController;
  String? Function(BuildContext, String?)?
      comunadelapersonaqueibaconduciendoControllerValidator;
  String? _comunadelapersonaqueibaconduciendoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Ciudaddelapersonaqueibaconduciendo widget.
  FocusNode? ciudaddelapersonaqueibaconduciendoFocusNode;
  TextEditingController? ciudaddelapersonaqueibaconduciendoController;
  String? Function(BuildContext, String?)?
      ciudaddelapersonaqueibaconduciendoControllerValidator;
  String? _ciudaddelapersonaqueibaconduciendoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Marcavehculo widget.
  FocusNode? marcavehculoFocusNode;
  TextEditingController? marcavehculoController;
  String? Function(BuildContext, String?)? marcavehculoControllerValidator;
  String? _marcavehculoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Modeloss widget.
  FocusNode? modelossFocusNode;
  TextEditingController? modelossController;
  String? Function(BuildContext, String?)? modelossControllerValidator;
  String? _modelossControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Ano widget.
  FocusNode? anoFocusNode1;
  TextEditingController? anoController1;
  String? Function(BuildContext, String?)? anoController1Validator;
  String? _anoController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Patente widget.
  FocusNode? patenteFocusNode;
  TextEditingController? patenteController;
  String? Function(BuildContext, String?)? patenteControllerValidator;
  String? _patenteControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for Calleendondeocurrielincidente widget.
  FocusNode? calleendondeocurrielincidenteFocusNode;
  TextEditingController? calleendondeocurrielincidenteController;
  String? Function(BuildContext, String?)?
      calleendondeocurrielincidenteControllerValidator;
  String? _calleendondeocurrielincidenteControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Comunaendondeocurrielincidente widget.
  FocusNode? comunaendondeocurrielincidenteFocusNode;
  TextEditingController? comunaendondeocurrielincidenteController;
  String? Function(BuildContext, String?)?
      comunaendondeocurrielincidenteControllerValidator;
  String? _comunaendondeocurrielincidenteControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Ciudadendondeocurrielincidente widget.
  FocusNode? ciudadendondeocurrielincidenteFocusNode;
  TextEditingController? ciudadendondeocurrielincidenteController;
  String? Function(BuildContext, String?)?
      ciudadendondeocurrielincidenteControllerValidator;
  String? _ciudadendondeocurrielincidenteControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Velocidadalmomentodelsiniestroenkm widget.
  FocusNode? velocidadalmomentodelsiniestroenkmFocusNode;
  TextEditingController? velocidadalmomentodelsiniestroenkmController;
  String? Function(BuildContext, String?)?
      velocidadalmomentodelsiniestroenkmControllerValidator;
  String? _velocidadalmomentodelsiniestroenkmControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Tipodesiniestro widget.
  FocusNode? tipodesiniestroFocusNode;
  TextEditingController? tipodesiniestroController;
  String? Function(BuildContext, String?)? tipodesiniestroControllerValidator;
  String? _tipodesiniestroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Elsiniestroseprodujoporaccin widget.
  FocusNode? elsiniestroseprodujoporaccinFocusNode;
  TextEditingController? elsiniestroseprodujoporaccinController;
  String? Function(BuildContext, String?)?
      elsiniestroseprodujoporaccinControllerValidator;
  String? _elsiniestroseprodujoporaccinControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Relatodeloshechos widget.
  FocusNode? relatodeloshechosFocusNode;
  TextEditingController? relatodeloshechosController;
  String? Function(BuildContext, String?)? relatodeloshechosControllerValidator;
  String? _relatodeloshechosControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Danos widget.
  FocusNode? danosFocusNode;
  TextEditingController? danosController;
  String? Function(BuildContext, String?)? danosControllerValidator;
  String? _danosControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  String? _nombreControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Rut widget.
  FocusNode? rutFocusNode1;
  TextEditingController? rutController1;
  String? Function(BuildContext, String?)? rutController1Validator;
  String? _rutController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Telfono widget.
  FocusNode? telfonoFocusNode;
  TextEditingController? telfonoController;
  String? Function(BuildContext, String?)? telfonoControllerValidator;
  String? _telfonoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Domicilio widget.
  FocusNode? domicilioFocusNode;
  TextEditingController? domicilioController;
  String? Function(BuildContext, String?)? domicilioControllerValidator;
  String? _domicilioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Mail widget.
  FocusNode? mailFocusNode;
  TextEditingController? mailController;
  String? Function(BuildContext, String?)? mailControllerValidator;
  String? _mailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for Compaiadeseguros widget.
  FocusNode? compaiadesegurosFocusNode;
  TextEditingController? compaiadesegurosController;
  String? Function(BuildContext, String?)? compaiadesegurosControllerValidator;
  String? _compaiadesegurosControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Placapatente widget.
  FocusNode? placapatenteFocusNode;
  TextEditingController? placapatenteController;
  String? Function(BuildContext, String?)? placapatenteControllerValidator;
  String? _placapatenteControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Marca widget.
  FocusNode? marcaFocusNode;
  TextEditingController? marcaController;
  String? Function(BuildContext, String?)? marcaControllerValidator;
  String? _marcaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Modelo widget.
  FocusNode? modeloFocusNode;
  TextEditingController? modeloController;
  String? Function(BuildContext, String?)? modeloControllerValidator;
  String? _modeloControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Ano widget.
  FocusNode? anoFocusNode2;
  TextEditingController? anoController2;
  String? Function(BuildContext, String?)? anoController2Validator;
  String? _anoController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Terceroculpalble widget.
  String? terceroculpalbleValue;
  FormFieldController<String>? terceroculpalbleValueController;
  // State field(s) for Lesionados widget.
  String? lesionadosValue;
  FormFieldController<String>? lesionadosValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Fecha widget.
  FocusNode? fechaFocusNode;
  TextEditingController? fechaController;
  String? Function(BuildContext, String?)? fechaControllerValidator;
  String? _fechaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Hora widget.
  FocusNode? horaFocusNode;
  TextEditingController? horaController;
  String? Function(BuildContext, String?)? horaControllerValidator;
  String? _horaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Nmerodeparte widget.
  FocusNode? nmerodeparteFocusNode;
  TextEditingController? nmerodeparteController;
  String? Function(BuildContext, String?)? nmerodeparteControllerValidator;
  String? _nmerodeparteControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Nmerodefolio widget.
  FocusNode? nmerodefolioFocusNode;
  TextEditingController? nmerodefolioController;
  String? Function(BuildContext, String?)? nmerodefolioControllerValidator;
  String? _nmerodefolioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Nmerodeconstancia widget.
  FocusNode? nmerodeconstanciaFocusNode;
  TextEditingController? nmerodeconstanciaController;
  String? Function(BuildContext, String?)? nmerodeconstanciaControllerValidator;
  String? _nmerodeconstanciaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Citacin widget.
  FocusNode? citacinFocusNode;
  TextEditingController? citacinController;
  String? Function(BuildContext, String?)? citacinControllerValidator;
  String? _citacinControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Fechadecitacin widget.
  FocusNode? fechadecitacinFocusNode;
  TextEditingController? fechadecitacinController;
  String? Function(BuildContext, String?)? fechadecitacinControllerValidator;
  String? _fechadecitacinControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Juzgado widget.
  FocusNode? juzgadoFocusNode;
  TextEditingController? juzgadoController;
  String? Function(BuildContext, String?)? juzgadoControllerValidator;
  String? _juzgadoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Nombrecompleto widget.
  FocusNode? nombrecompletoFocusNode;
  TextEditingController? nombrecompletoController;
  String? Function(BuildContext, String?)? nombrecompletoControllerValidator;
  String? _nombrecompletoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Rut widget.
  FocusNode? rutFocusNode2;
  TextEditingController? rutController2;
  String? Function(BuildContext, String?)? rutController2Validator;
  String? _rutController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Firma widget.
  FocusNode? firmaFocusNode;
  TextEditingController? firmaController;
  String? Function(BuildContext, String?)? firmaControllerValidator;
  String? _firmaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (raise ticket of car crash)] action in Button widget.
  ApiCallResponse? formResponse;
  // Model for bottom_nav_bar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nombredelapersonaqueibaconduciendoControllerValidator =
        _nombredelapersonaqueibaconduciendoControllerValidator;
    rutoPasaportedelapersonaqueibaconduciendoControllerValidator =
        _rutoPasaportedelapersonaqueibaconduciendoControllerValidator;
    nacionalidadControllerValidator = _nacionalidadControllerValidator;
    direccinCalleynmerodelapersonaqueibaconduciendoControllerValidator =
        _direccinCalleynmerodelapersonaqueibaconduciendoControllerValidator;
    comunadelapersonaqueibaconduciendoControllerValidator =
        _comunadelapersonaqueibaconduciendoControllerValidator;
    ciudaddelapersonaqueibaconduciendoControllerValidator =
        _ciudaddelapersonaqueibaconduciendoControllerValidator;
    marcavehculoControllerValidator = _marcavehculoControllerValidator;
    modelossControllerValidator = _modelossControllerValidator;
    anoController1Validator = _anoController1Validator;
    patenteControllerValidator = _patenteControllerValidator;
    calleendondeocurrielincidenteControllerValidator =
        _calleendondeocurrielincidenteControllerValidator;
    comunaendondeocurrielincidenteControllerValidator =
        _comunaendondeocurrielincidenteControllerValidator;
    ciudadendondeocurrielincidenteControllerValidator =
        _ciudadendondeocurrielincidenteControllerValidator;
    velocidadalmomentodelsiniestroenkmControllerValidator =
        _velocidadalmomentodelsiniestroenkmControllerValidator;
    tipodesiniestroControllerValidator = _tipodesiniestroControllerValidator;
    elsiniestroseprodujoporaccinControllerValidator =
        _elsiniestroseprodujoporaccinControllerValidator;
    relatodeloshechosControllerValidator =
        _relatodeloshechosControllerValidator;
    danosControllerValidator = _danosControllerValidator;
    nombreControllerValidator = _nombreControllerValidator;
    rutController1Validator = _rutController1Validator;
    telfonoControllerValidator = _telfonoControllerValidator;
    domicilioControllerValidator = _domicilioControllerValidator;
    mailControllerValidator = _mailControllerValidator;
    compaiadesegurosControllerValidator = _compaiadesegurosControllerValidator;
    placapatenteControllerValidator = _placapatenteControllerValidator;
    marcaControllerValidator = _marcaControllerValidator;
    modeloControllerValidator = _modeloControllerValidator;
    anoController2Validator = _anoController2Validator;
    fechaControllerValidator = _fechaControllerValidator;
    horaControllerValidator = _horaControllerValidator;
    nmerodeparteControllerValidator = _nmerodeparteControllerValidator;
    nmerodefolioControllerValidator = _nmerodefolioControllerValidator;
    nmerodeconstanciaControllerValidator =
        _nmerodeconstanciaControllerValidator;
    citacinControllerValidator = _citacinControllerValidator;
    fechadecitacinControllerValidator = _fechadecitacinControllerValidator;
    juzgadoControllerValidator = _juzgadoControllerValidator;
    nombrecompletoControllerValidator = _nombrecompletoControllerValidator;
    rutController2Validator = _rutController2Validator;
    firmaControllerValidator = _firmaControllerValidator;
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    nombredelapersonaqueibaconduciendoFocusNode?.dispose();
    nombredelapersonaqueibaconduciendoController?.dispose();

    rutoPasaportedelapersonaqueibaconduciendoFocusNode?.dispose();
    rutoPasaportedelapersonaqueibaconduciendoController?.dispose();

    nacionalidadFocusNode?.dispose();
    nacionalidadController?.dispose();

    direccinCalleynmerodelapersonaqueibaconduciendoFocusNode?.dispose();
    direccinCalleynmerodelapersonaqueibaconduciendoController?.dispose();

    comunadelapersonaqueibaconduciendoFocusNode?.dispose();
    comunadelapersonaqueibaconduciendoController?.dispose();

    ciudaddelapersonaqueibaconduciendoFocusNode?.dispose();
    ciudaddelapersonaqueibaconduciendoController?.dispose();

    marcavehculoFocusNode?.dispose();
    marcavehculoController?.dispose();

    modelossFocusNode?.dispose();
    modelossController?.dispose();

    anoFocusNode1?.dispose();
    anoController1?.dispose();

    patenteFocusNode?.dispose();
    patenteController?.dispose();

    calleendondeocurrielincidenteFocusNode?.dispose();
    calleendondeocurrielincidenteController?.dispose();

    comunaendondeocurrielincidenteFocusNode?.dispose();
    comunaendondeocurrielincidenteController?.dispose();

    ciudadendondeocurrielincidenteFocusNode?.dispose();
    ciudadendondeocurrielincidenteController?.dispose();

    velocidadalmomentodelsiniestroenkmFocusNode?.dispose();
    velocidadalmomentodelsiniestroenkmController?.dispose();

    tipodesiniestroFocusNode?.dispose();
    tipodesiniestroController?.dispose();

    elsiniestroseprodujoporaccinFocusNode?.dispose();
    elsiniestroseprodujoporaccinController?.dispose();

    relatodeloshechosFocusNode?.dispose();
    relatodeloshechosController?.dispose();

    danosFocusNode?.dispose();
    danosController?.dispose();

    nombreFocusNode?.dispose();
    nombreController?.dispose();

    rutFocusNode1?.dispose();
    rutController1?.dispose();

    telfonoFocusNode?.dispose();
    telfonoController?.dispose();

    domicilioFocusNode?.dispose();
    domicilioController?.dispose();

    mailFocusNode?.dispose();
    mailController?.dispose();

    compaiadesegurosFocusNode?.dispose();
    compaiadesegurosController?.dispose();

    placapatenteFocusNode?.dispose();
    placapatenteController?.dispose();

    marcaFocusNode?.dispose();
    marcaController?.dispose();

    modeloFocusNode?.dispose();
    modeloController?.dispose();

    anoFocusNode2?.dispose();
    anoController2?.dispose();

    fechaFocusNode?.dispose();
    fechaController?.dispose();

    horaFocusNode?.dispose();
    horaController?.dispose();

    nmerodeparteFocusNode?.dispose();
    nmerodeparteController?.dispose();

    nmerodefolioFocusNode?.dispose();
    nmerodefolioController?.dispose();

    nmerodeconstanciaFocusNode?.dispose();
    nmerodeconstanciaController?.dispose();

    citacinFocusNode?.dispose();
    citacinController?.dispose();

    fechadecitacinFocusNode?.dispose();
    fechadecitacinController?.dispose();

    juzgadoFocusNode?.dispose();
    juzgadoController?.dispose();

    nombrecompletoFocusNode?.dispose();
    nombrecompletoController?.dispose();

    rutFocusNode2?.dispose();
    rutController2?.dispose();

    firmaFocusNode?.dispose();
    firmaController?.dispose();

    bottomNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
