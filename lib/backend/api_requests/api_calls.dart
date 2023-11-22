import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start car crash Group Code

class CarCrashGroup {
  static String baseUrl = 'https://soporte.connectcar.cl/api/v1/';
  static Map<String, String> headers = {};
  static RaiseTicketOfCarCrashCall raiseTicketOfCarCrashCall =
      RaiseTicketOfCarCrashCall();
}

class RaiseTicketOfCarCrashCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? group = '',
    dynamic articleJson,
    String? customerId = '',
    String? tags = '',
    String? fechaDeHoy = '',
    String? nombreDeLaPersonaQueIbaConduciendo = '',
    String? rutOPasaporteDeLaPersonaQueIbaConduciendo = '',
    String? nacionalidad = '',
    String? direccionDeLaPersonaQueIbaConduciendo = '',
    String? comunaDeLaPersonaQueIbaConduciendo = '',
    String? ciudadDeLaPersonaQueIbaConduciendo = '',
    String? marcaVehiculo = '',
    String? modeloVehiculo = '',
    String? anoVehiculo = '',
    String? patenteVehiculo = '',
    String? fechaEnQueOcurrioElIncidente = '',
    String? horaEnQueOcurrioElIncidente = '',
    String? calleEnDondeOcurrioElIncidente = '',
    String? comunaEnDondeOcurrioElIncidente = '',
    String? ciudadEnDondeOcurrioElIncidente = '',
    String? velocidadAlMomentoDelSiniestroEnKm = '',
    String? eventType = '',
    String? elSiniestroSeProdujoPorAccion = '',
    String? relatoDeLosHechos = '',
    String? danos = '',
    String? tercerosInvolucrados = '',
    String? tercerosNombre = '',
    String? tercerosRut = '',
    String? tercerosTelefono = '',
    String? tercerosDomicilio = '',
    String? tercerosMail = '',
    String? tercerosCompaniaDeSeguros = '',
    String? tercerosPlacaPatente = '',
    String? tercerosMarca = '',
    String? tercerosModelo = '',
    String? tercerosAno = '',
    String? tercerosCulpable = '',
    String? tercerosLesionados = '',
    String? concurreCarabinerosAlLugarDelSiniestro = '',
    String? carabinerosFecha = '',
    String? carabinerosHora = '',
    String? carabinerosNumeroDeParte = '',
    String? carabinerosNumeroDeFolio = '',
    String? carabinerosNumeroDeConstancia = '',
    String? carabinerosCitacion1 = '',
    String? carabinerosFechaDeCitacion = '',
    String? carabinerosJuzgado = '',
    String? declaracionNombreCompleto = '',
    String? declaracionRut = '',
    String? authorizationToken =
        'Basic YWRtaW4tY2NAbWFya2V0c2hvcC5pbzpQbGVqODc0NA==',
  }) async {
    final article = _serializeJson(articleJson);
    final ffApiRequestBody = '''
{
  "title": "$title",
  "group": "$group",
  "article": $article,
  "customer_id": "$customerId",
  "tags": "$tags",
  "fecha_de_hoy": "$fechaDeHoy",
  "nombre_de_la_persona_que_iba_conduciendo": "$nombreDeLaPersonaQueIbaConduciendo",
  "rut_o_pasaporte_de_la_persona_que_iba_conduciendo": "$rutOPasaporteDeLaPersonaQueIbaConduciendo",
  "nacionalidad": "$nacionalidad",
  "direccion_de_la_persona_que_iba_conduciendo": "$direccionDeLaPersonaQueIbaConduciendo",
  "comuna_de_la_persona_que_iba_conduciendo": "$comunaDeLaPersonaQueIbaConduciendo",
  "ciudad_de_la_persona_que_iba_conduciendo": "$ciudadDeLaPersonaQueIbaConduciendo",
  "marca_vehiculo": "$marcaVehiculo",
  "modelo_vehiculo": "$modeloVehiculo",
  "ano_vehiculo": "$anoVehiculo",
  "patente_vehiculo": "$patenteVehiculo",
  "fecha_en_que_ocurrio_el_incidente": "$fechaEnQueOcurrioElIncidente",
  "hora_en_que_ocurrio_el_incidente": "$horaEnQueOcurrioElIncidente",
  "calle_en_donde_ocurrio_el_incidente": "$calleEnDondeOcurrioElIncidente",
  "comuna_en_donde_ocurrio_el_incidente": "$comunaEnDondeOcurrioElIncidente",
  "ciudad_en_donde_ocurrio_el_incidente": "$ciudadEnDondeOcurrioElIncidente",
  "velocidad_al_momento_del_siniestro_en_km": "$velocidadAlMomentoDelSiniestroEnKm",
  "event_type": "$eventType",
  "el_siniestro_se_produjo_por_accion": "$elSiniestroSeProdujoPorAccion",
  "relato_de_los_hechos": "$relatoDeLosHechos",
  "danos": "$danos",
  "terceros_involucrados": "$tercerosInvolucrados",
  "terceros_nombre": "$tercerosNombre",
  "terceros_rut": "$tercerosRut",
  "terceros_telefono": "$tercerosTelefono",
  "terceros_domicilio": "$tercerosDomicilio",
  "terceros_mail": "$tercerosMail",
  "terceros_compania_de_seguros": "$tercerosCompaniaDeSeguros",
  "terceros_placa_patente": "$tercerosPlacaPatente",
  "terceros_marca": "$tercerosMarca",
  "terceros_modelo": "$tercerosModelo",
  "terceros_ano": "$tercerosAno",
  "terceros_culpable": "$tercerosCulpable",
  "terceros_lesionados": "$tercerosLesionados",
  "concurre_carabineros_al_lugar_del_siniestro": "$concurreCarabinerosAlLugarDelSiniestro",
  "carabineros_fecha": "$carabinerosFecha",
  "carabineros_hora": "$carabinerosHora",
  "carabineros_numero_de_parte": "$carabinerosNumeroDeParte",
  "carabineros_numero_de_folio": "$carabinerosNumeroDeFolio",
  "carabineros_numero_de_constancia": "$carabinerosNumeroDeConstancia",
  "carabineros_citacion1": "$carabinerosCitacion1",
  "carabineros_fecha_de_citacion": "$carabinerosFechaDeCitacion",
  "carabineros_juzgado": "$carabinerosJuzgado",
  "declaracion_nombre_completo": "$declaracionNombreCompleto",
  "declaracion_rut": "$declaracionRut"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'raise ticket of car crash',
      apiUrl: '${CarCrashGroup.baseUrl}tickets/',
      callType: ApiCallType.POST,
      headers: {
        'X-On-Behalf-Of': 'nmella@cenabast.cl',
        'Content-Type': 'application/json',
        'Authorization': '$authorizationToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End car crash Group Code

class UserLoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Login',
      apiUrl: 'https://fastdev.connectcar.cl/login',
      callType: ApiCallType.POST,
      headers: {
        'Origin': 'https://dev.app.connectcar.cl',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic userid(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.data.token''',
      );
  static dynamic expiration(dynamic response) => getJsonField(
        response,
        r'''$.data.expiration''',
      );
  static dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.data.userId''',
      );
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static dynamic refreshToken(dynamic response) => getJsonField(
        response,
        r'''$.data.refreshToken''',
      );
}

class UserCredentialsResetCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "step": "REQUEST",
  "email": "$email",
  "redirect_url": "https://dev.app.connectcar.cl/auth/reset"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Credentials Reset',
      apiUrl: 'https://fastdev.connectcar.cl/user_credential_reset',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Origin': 'https://dev.app.connectcar.cl',
        'token': 'Barear $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class UserSuspcriptionsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User Suspcriptions',
      apiUrl: 'https://fastdev.connectcar.cl/subscriptions',
      callType: ApiCallType.GET,
      headers: {
        'Origin': 'https://dev.app.connectcar.cl',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status''',
      );
  static dynamic startTimeStamp(dynamic response) => getJsonField(
        response,
        r'''$.data[:].startTimestamp''',
      );
  static dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].createdAt''',
      );
  static dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.data[:].userId''',
      );
  static dynamic currency(dynamic response) => getJsonField(
        response,
        r'''$.data[:].currency''',
      );
  static dynamic periodPrice(dynamic response) => getJsonField(
        response,
        r'''$.data[:].periodPrice''',
      );
  static dynamic periodAmount(dynamic response) => getJsonField(
        response,
        r'''$.data[:].periodsAmount''',
      );
  static dynamic periodType(dynamic response) => getJsonField(
        response,
        r'''$.data[:].periodType''',
      );
  static dynamic vehicleId(dynamic response) => getJsonField(
        response,
        r'''$.data[:].vehicleId''',
      );
  static dynamic updateedAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].updatedAt''',
      );
}

class UserInfoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User Info',
      apiUrl: 'https://fastdev.connectcar.cl/users/654a58e4398d25d37d2b0ebb',
      callType: ApiCallType.GET,
      headers: {
        'Origin': 'https://dev.app.connectcar.cl',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SubscriptionsVehicleCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? vehicleId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Subscriptions Vehicle',
      apiUrl:
          'https://fastdev.connectcar.cl/subscription_vehicles/$vehicleId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
        'Origin': 'https://dev.app.connectcar.cl',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
  static dynamic brans(dynamic response) => getJsonField(
        response,
        r'''$.data.brand''',
      );
  static dynamic model(dynamic response) => getJsonField(
        response,
        r'''$.data.model''',
      );
  static dynamic version(dynamic response) => getJsonField(
        response,
        r'''$.data.version''',
      );
  static dynamic year(dynamic response) => getJsonField(
        response,
        r'''$.data.year''',
      );
  static dynamic category(dynamic response) => getJsonField(
        response,
        r'''$.data.category''',
      );
}

class UserVehicleImageCall {
  static Future<ApiCallResponse> call({
    String? brand = '',
    String? model = '',
    String? version = '',
    String? year = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User Vehicle Image',
      apiUrl:
          'https://fastdev.connectcar.cl/vehicle-images?brand=Audi&model=A3&version=DTI 2008&year=2023',
      callType: ApiCallType.GET,
      headers: {
        'Origin': 'https://dev.app.connectcar.cl',
        'token': 'Bearer $token',
      },
      params: {
        'brand': brand,
        'model': model,
        'version': version,
        'year': year,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class RefreshTokenCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "$token"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'refresh token',
      apiUrl: 'https://fastdev.connectcar.cl/refresh',
      callType: ApiCallType.POST,
      headers: {
        'Origin': 'https://dev.app.connectcar.cl',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.data.accessToken''',
      );
  static dynamic expiration(dynamic response) => getJsonField(
        response,
        r'''$.data.expiration''',
      );
  static dynamic refreshToken(dynamic response) => getJsonField(
        response,
        r'''$.data.refreshToken''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
