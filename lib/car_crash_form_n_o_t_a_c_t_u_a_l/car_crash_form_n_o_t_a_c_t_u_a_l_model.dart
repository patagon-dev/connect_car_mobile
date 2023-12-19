import '/backend/api_requests/api_calls.dart';
import '/components/dropdown_comp_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'car_crash_form_n_o_t_a_c_t_u_a_l_widget.dart'
    show CarCrashFormNOTACTUALWidget;
import 'package:flutter/material.dart';

class CarCrashFormNOTACTUALModel
    extends FlutterFlowModel<CarCrashFormNOTACTUALWidget> {
  ///  Local state fields for this page.

  String refreshField = '1';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  DateTime? datePicked1;
  // State field(s) for Nombredelapersonaqueibaconduciendo widget.
  FocusNode? nombredelapersonaqueibaconduciendoFocusNode;
  TextEditingController? nombredelapersonaqueibaconduciendoController;
  String? Function(BuildContext, String?)?
      nombredelapersonaqueibaconduciendoControllerValidator;
  String? _nombredelapersonaqueibaconduciendoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
    }

    if (val.length > 12) {
      return 'RUT inválido';
    }
    if (!RegExp('^([1-9]|[1-9]\\d|[1-9]\\d{2})(\\.\\d{3})*\\-(\\d|k|K)\$')
        .hasMatch(val)) {
      return 'RUT inválido';
    }
    return null;
  }

  // State field(s) for Nacionalidad widget.
  FocusNode? nacionalidadFocusNode;
  TextEditingController? nacionalidadController;
  String? Function(BuildContext, String?)? nacionalidadControllerValidator;
  String? _nacionalidadControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Comunadelapersonaqueibaconduciendo widget.
  String? comunadelapersonaqueibaconduciendoValue;
  FormFieldController<String>?
      comunadelapersonaqueibaconduciendoValueController;
  // State field(s) for Ciudaddelapersonaqueibaconduciendo widget.
  FocusNode? ciudaddelapersonaqueibaconduciendoFocusNode;
  TextEditingController? ciudaddelapersonaqueibaconduciendoController;
  String? Function(BuildContext, String?)?
      ciudaddelapersonaqueibaconduciendoControllerValidator;
  String? _ciudaddelapersonaqueibaconduciendoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio';
    }

    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Marcavehculo widget.
  FocusNode? marcavehculoFocusNode;
  TextEditingController? marcavehculoController;
  String? Function(BuildContext, String?)? marcavehculoControllerValidator;
  String? _marcavehculoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Tercerosinvolucrados widget.
  String? tercerosinvolucradosValue;
  FormFieldController<String>? tercerosinvolucradosValueController;
  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  String? _nombreControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Rut widget.
  FocusNode? rutFocusNode;
  TextEditingController? rutController;
  String? Function(BuildContext, String?)? rutControllerValidator;
  String? _rutControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio';
    }

    if (val.length > 12) {
      return 'RUT inválido';
    }
    if (!RegExp('^([1-9]|[1-9]\\d|[1-9]\\d{2})(\\.\\d{3})*\\-(\\d|k|K)\$')
        .hasMatch(val)) {
      return 'RUT inválido';
    }
    return null;
  }

  // State field(s) for Telfono widget.
  FocusNode? telfonoFocusNode;
  TextEditingController? telfonoController;
  String? Function(BuildContext, String?)? telfonoControllerValidator;
  String? _telfonoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email is Invalid';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
    }

    if (val.length > 10) {
      return 'RUT inválido';
    }

    return null;
  }

  // State field(s) for Marca widget.
  FocusNode? marcaFocusNode;
  TextEditingController? marcaController;
  String? Function(BuildContext, String?)? marcaControllerValidator;
  String? _marcaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
  // Model for dropdownComp component.
  late DropdownCompModel dropdownCompModel;
  // State field(s) for Hora widget.
  FocusNode? horaFocusNode;
  TextEditingController? horaController;
  String? Function(BuildContext, String?)? horaControllerValidator;
  String? _horaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
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
      return 'Campo obligatorio';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for Rut2 widget.
  FocusNode? rut2FocusNode;
  TextEditingController? rut2Controller;
  String? Function(BuildContext, String?)? rut2ControllerValidator;
  String? _rut2ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio';
    }

    if (val.length > 12) {
      return 'RUT inválido';
    }
    if (!RegExp('^([1-9]|[1-9]\\d|[1-9]\\d{2})(\\.\\d{3})*\\-(\\d|k|K)\$')
        .hasMatch(val)) {
      return 'RUT inválido';
    }
    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (create zamad user)] action in Button widget.
  ApiCallResponse? createUserResponse;
  // Stores action output result for [Custom Action - checkUserExistInZamad] action in Button widget.
  bool? checkUserIsExist;
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nombredelapersonaqueibaconduciendoControllerValidator =
        _nombredelapersonaqueibaconduciendoControllerValidator;
    rutoPasaportedelapersonaqueibaconduciendoControllerValidator =
        _rutoPasaportedelapersonaqueibaconduciendoControllerValidator;
    nacionalidadControllerValidator = _nacionalidadControllerValidator;
    direccinCalleynmerodelapersonaqueibaconduciendoControllerValidator =
        _direccinCalleynmerodelapersonaqueibaconduciendoControllerValidator;
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
    rutControllerValidator = _rutControllerValidator;
    telfonoControllerValidator = _telfonoControllerValidator;
    domicilioControllerValidator = _domicilioControllerValidator;
    mailControllerValidator = _mailControllerValidator;
    compaiadesegurosControllerValidator = _compaiadesegurosControllerValidator;
    placapatenteControllerValidator = _placapatenteControllerValidator;
    marcaControllerValidator = _marcaControllerValidator;
    modeloControllerValidator = _modeloControllerValidator;
    anoController2Validator = _anoController2Validator;
    dropdownCompModel = createModel(context, () => DropdownCompModel());
    horaControllerValidator = _horaControllerValidator;
    nmerodeparteControllerValidator = _nmerodeparteControllerValidator;
    nmerodefolioControllerValidator = _nmerodefolioControllerValidator;
    nmerodeconstanciaControllerValidator =
        _nmerodeconstanciaControllerValidator;
    citacinControllerValidator = _citacinControllerValidator;
    fechadecitacinControllerValidator = _fechadecitacinControllerValidator;
    juzgadoControllerValidator = _juzgadoControllerValidator;
    nombrecompletoControllerValidator = _nombrecompletoControllerValidator;
    rut2ControllerValidator = _rut2ControllerValidator;
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
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

    rutFocusNode?.dispose();
    rutController?.dispose();

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

    dropdownCompModel.dispose();
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

    rut2FocusNode?.dispose();
    rut2Controller?.dispose();

    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
