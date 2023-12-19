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
  static ScheduleRequestInZamadCall scheduleRequestInZamadCall =
      ScheduleRequestInZamadCall();
  static CreateZamadUserCall createZamadUserCall = CreateZamadUserCall();
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
    String? authorizationToken = 'YWRtaW4tY2NAbWFya2V0c2hvcC5pbzpQbGVqODc0NA==',
    String? userEmail = '',
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
        'X-On-Behalf-Of': '$userEmail',
        'Content-Type': 'application/json',
        'Authorization': 'Basic $authorizationToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic groupID(dynamic response) => getJsonField(
        response,
        r'''$.group_id''',
      );
  dynamic priorityID(dynamic response) => getJsonField(
        response,
        r'''$.priority_id''',
      );
  dynamic stateID(dynamic response) => getJsonField(
        response,
        r'''$.state_id''',
      );
  dynamic number(dynamic response) => getJsonField(
        response,
        r'''$.number''',
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.title''',
      );
  dynamic ownerID(dynamic response) => getJsonField(
        response,
        r'''$.owner_id''',
      );
  dynamic customerID(dynamic response) => getJsonField(
        response,
        r'''$.customer_id''',
      );
  dynamic lastContactAt(dynamic response) => getJsonField(
        response,
        r'''$.last_contact_at''',
      );
  dynamic lastContactCustomerAt(dynamic response) => getJsonField(
        response,
        r'''$.last_contact_customer_at''',
      );
  dynamic createArticleTypeId(dynamic response) => getJsonField(
        response,
        r'''$.create_article_type_id''',
      );
  dynamic createArticleSenderID(dynamic response) => getJsonField(
        response,
        r'''$.create_article_sender_id''',
      );
  dynamic articleCount(dynamic response) => getJsonField(
        response,
        r'''$.article_count''',
      );
  dynamic preferences(dynamic response) => getJsonField(
        response,
        r'''$.preferences''',
      );
  dynamic updatedById(dynamic response) => getJsonField(
        response,
        r'''$.updated_by_id''',
      );
  dynamic createdById(dynamic response) => getJsonField(
        response,
        r'''$.created_by_id''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic updatedAt(dynamic response) => getJsonField(
        response,
        r'''$.updated_at''',
      );
  dynamic eventType(dynamic response) => getJsonField(
        response,
        r'''$.event_type''',
      );
  dynamic nombreDeLaPersonaQueIbaConduciendo(dynamic response) => getJsonField(
        response,
        r'''$.nombre_de_la_persona_que_iba_conduciendo''',
      );
  dynamic rutOOasaporteDeLaPersonaQueIbaConduciendo(dynamic response) =>
      getJsonField(
        response,
        r'''$.rut_o_pasaporte_de_la_persona_que_iba_conduciendo''',
      );
  dynamic nacionalidad(dynamic response) => getJsonField(
        response,
        r'''$.nacionalidad''',
      );
  dynamic direccionDeLaPersonaQueIbaConduciendo(dynamic response) =>
      getJsonField(
        response,
        r'''$.direccion_de_la_persona_que_iba_conduciendo''',
      );
  dynamic comunaDeLaPersonaQueIbaConduciendo(dynamic response) => getJsonField(
        response,
        r'''$.comuna_de_la_persona_que_iba_conduciendo''',
      );
  dynamic ciudadDeLaPersonaQueIbaConduciendo(dynamic response) => getJsonField(
        response,
        r'''$.ciudad_de_la_persona_que_iba_conduciendo''',
      );
  dynamic marcaVehiculo(dynamic response) => getJsonField(
        response,
        r'''$.marca_vehiculo''',
      );
  dynamic modeloVehiculo(dynamic response) => getJsonField(
        response,
        r'''$.modelo_vehiculo''',
      );
  dynamic anoVehiculo(dynamic response) => getJsonField(
        response,
        r'''$.ano_vehiculo''',
      );
  dynamic patenteVehiculo(dynamic response) => getJsonField(
        response,
        r'''$.patente_vehiculo''',
      );
  dynamic horaEnQueOcurrioElIncidente(dynamic response) => getJsonField(
        response,
        r'''$.hora_en_que_ocurrio_el_incidente''',
      );
  dynamic calleEnDondeOcurrioElIncidente(dynamic response) => getJsonField(
        response,
        r'''$.calle_en_donde_ocurrio_el_incidente''',
      );
  dynamic comunaEnDondeOcurrioElIncidente(dynamic response) => getJsonField(
        response,
        r'''$.comuna_en_donde_ocurrio_el_incidente''',
      );
  dynamic ciudadEnDondeOcurrioElIncidente(dynamic response) => getJsonField(
        response,
        r'''$.ciudad_en_donde_ocurrio_el_incidente''',
      );
  dynamic velocidadAlMomentoDelSiniestroEnKm(dynamic response) => getJsonField(
        response,
        r'''$.velocidad_al_momento_del_siniestro_en_km''',
      );
  dynamic elSiniestroSeProdujoPorAccion(dynamic response) => getJsonField(
        response,
        r'''$.el_siniestro_se_produjo_por_accion''',
      );
  dynamic relatoDeLosHechos(dynamic response) => getJsonField(
        response,
        r'''$.relato_de_los_hechos''',
      );
  dynamic danos(dynamic response) => getJsonField(
        response,
        r'''$.danos''',
      );
  dynamic tercerosRut(dynamic response) => getJsonField(
        response,
        r'''$.terceros_rut''',
      );
  dynamic tercerosTelefono(dynamic response) => getJsonField(
        response,
        r'''$.terceros_telefono''',
      );
  dynamic tercerosDomicilio(dynamic response) => getJsonField(
        response,
        r'''$.terceros_domicilio''',
      );
  dynamic tercerosMarca(dynamic response) => getJsonField(
        response,
        r'''$.terceros_marca''',
      );
  dynamic tercerosModelo(dynamic response) => getJsonField(
        response,
        r'''$.terceros_modelo''',
      );
  dynamic tercerosAno(dynamic response) => getJsonField(
        response,
        r'''$.terceros_ano''',
      );
  dynamic tercerosCulpable(dynamic response) => getJsonField(
        response,
        r'''$.terceros_culpable''',
      );
  dynamic carabinerosJuzgado(dynamic response) => getJsonField(
        response,
        r'''$.carabineros_juzgado''',
      );
  dynamic declaracionRut(dynamic response) => getJsonField(
        response,
        r'''$.declaracion_rut''',
      );
  List<int>? articleIds(dynamic response) => (getJsonField(
        response,
        r'''$.article_ids''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List? ticketTimeAccountingIds(dynamic response) => getJsonField(
        response,
        r'''$.ticket_time_accounting_ids''',
        true,
      ) as List?;
}

class ScheduleRequestInZamadCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? group = 'Users',
    dynamic articleJson,
    String? customerId = '',
    String? email = '',
    String? authTokenBearer =
        'Bearer MfaSE3CHlbT58A3czVPM7E8mn3UhNlcxfTQ6OMcvixnLAdhnWO2rXooPOq0n7UqJ',
  }) async {
    final article = _serializeJson(articleJson);
    final ffApiRequestBody = '''
{
  "title": "$title",
  "group": "$group",
  "article": $article,
  "customer_id":"$customerId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'schedule request in  Zamad',
      apiUrl: '${CarCrashGroup.baseUrl}tickets/',
      callType: ApiCallType.POST,
      headers: {
        'X-On-Behalf-Of': '$email',
        'Authorization': '$authTokenBearer',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic ticketID(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic groupID(dynamic response) => getJsonField(
        response,
        r'''$.group_id''',
      );
  dynamic priorityID(dynamic response) => getJsonField(
        response,
        r'''$.priority_id''',
      );
  dynamic stateID(dynamic response) => getJsonField(
        response,
        r'''$.state_id''',
      );
  dynamic number(dynamic response) => getJsonField(
        response,
        r'''$.number''',
      );
  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.title''',
      );
  dynamic ownerID(dynamic response) => getJsonField(
        response,
        r'''$.owner_id''',
      );
  dynamic customerID(dynamic response) => getJsonField(
        response,
        r'''$.customer_id''',
      );
  dynamic lastContactAt(dynamic response) => getJsonField(
        response,
        r'''$.last_contact_at''',
      );
  dynamic lastContactCustomerAt(dynamic response) => getJsonField(
        response,
        r'''$.last_contact_customer_at''',
      );
  dynamic createArticleTypeId(dynamic response) => getJsonField(
        response,
        r'''$.create_article_type_id''',
      );
  dynamic createArticleSenderId(dynamic response) => getJsonField(
        response,
        r'''$.create_article_sender_id''',
      );
  dynamic articleCount(dynamic response) => getJsonField(
        response,
        r'''$.article_count''',
      );
  dynamic preferences(dynamic response) => getJsonField(
        response,
        r'''$.preferences''',
      );
  dynamic updatedById(dynamic response) => getJsonField(
        response,
        r'''$.updated_by_id''',
      );
  dynamic createdById(dynamic response) => getJsonField(
        response,
        r'''$.created_by_id''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic updatedAt(dynamic response) => getJsonField(
        response,
        r'''$.updated_at''',
      );
  List<int>? articleIds(dynamic response) => (getJsonField(
        response,
        r'''$.article_ids''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<int>();
  List? ticketTimeAccountingIds(dynamic response) => getJsonField(
        response,
        r'''$.ticket_time_accounting_ids''',
        true,
      ) as List?;
  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
  dynamic errorHuman(dynamic response) => getJsonField(
        response,
        r'''$.error_human''',
      );
}

class CreateZamadUserCall {
  Future<ApiCallResponse> call({
    String? userEmail = '',
    String? roles = 'Customer',
    String? authorizationToken =
        'Token MfaSE3CHlbT58A3czVPM7E8mn3UhNlcxfTQ6OMcvixnLAdhnWO2rXooPOq0n7UqJ',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$userEmail",
  "login": "$userEmail",
  "roles": [
    "$roles"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create zamad user',
      apiUrl: '${CarCrashGroup.baseUrl}users',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '$authorizationToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic customerID(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic loginMail(dynamic response) => getJsonField(
        response,
        r'''$.login''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  dynamic isVIP(dynamic response) => getJsonField(
        response,
        r'''$.vip''',
      );
  dynamic isVerified(dynamic response) => getJsonField(
        response,
        r'''$.verified''',
      );
  dynamic isActive(dynamic response) => getJsonField(
        response,
        r'''$.active''',
      );
  dynamic loginFailed(dynamic response) => getJsonField(
        response,
        r'''$.login_failed''',
      );
  dynamic isOutOfOffice(dynamic response) => getJsonField(
        response,
        r'''$.out_of_office''',
      );
  dynamic preferences(dynamic response) => getJsonField(
        response,
        r'''$.preferences''',
      );
  dynamic updatedByID(dynamic response) => getJsonField(
        response,
        r'''$.updated_by_id''',
      );
  dynamic createdByID(dynamic response) => getJsonField(
        response,
        r'''$.created_by_id''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  dynamic updatedAt(dynamic response) => getJsonField(
        response,
        r'''$.updated_at''',
      );
  List? roleIDs(dynamic response) => getJsonField(
        response,
        r'''$.role_ids''',
        true,
      ) as List?;
  List? twoFactorPreferenceIds(dynamic response) => getJsonField(
        response,
        r'''$.two_factor_preference_ids''',
        true,
      ) as List?;
  List? organizationIDs(dynamic response) => getJsonField(
        response,
        r'''$.organization_ids''',
        true,
      ) as List?;
  List? authorizationIDs(dynamic response) => getJsonField(
        response,
        r'''$.authorization_ids''',
        true,
      ) as List?;
  List? overviewSortingIDs(dynamic response) => getJsonField(
        response,
        r'''$.overview_sorting_ids''',
        true,
      ) as List?;
  dynamic groupIDs(dynamic response) => getJsonField(
        response,
        r'''$.group_ids''',
      );
  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
  dynamic errorHuman(dynamic response) => getJsonField(
        response,
        r'''$.error_human''',
      );
}

/// End car crash Group Code

/// Start connect car api Group Code

class ConnectCarApiGroup {
  static String baseUrl = 'fastdev.connectcar.cl';
  static Map<String, String> headers = {};
  static GetUserBasicDataCall getUserBasicDataCall = GetUserBasicDataCall();
  static GetUserAddressCall getUserAddressCall = GetUserAddressCall();
  static PaymentHistoryDetailsCall paymentHistoryDetailsCall =
      PaymentHistoryDetailsCall();
}

class GetUserBasicDataCall {
  Future<ApiCallResponse> call({
    String? userID = '654a58e4398d25d37d2b0ebb',
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NTRhNThlNDM5OGQyNWQzN2QyYjBlYmIiLCJleHBpcmVzSW4iOjM2MDAsImlhdCI6MTcwMTMzMDE2MSwiZXhwIjoxNzAxMzMzNzYxfQ.I-3dhcggSAhk5NThZwLhNVyTnqFdBi-_MUvfw18vygQ',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get user basic data',
      apiUrl: '${ConnectCarApiGroup.baseUrl}/users/$userID',
      callType: ApiCallType.GET,
      headers: {
        'Origin': 'https://dev.app.connectcar.cl',
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.data.createdAt''',
      );
  dynamic updatedAt(dynamic response) => getJsonField(
        response,
        r'''$.data.updatedAt''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.data.email''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data.lastname''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data.firstname''',
      );
  dynamic dataID(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
}

class GetUserAddressCall {
  Future<ApiCallResponse> call({
    String? userID = '654a58e4398d25d37d2b0ebb',
    String? authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NTRhNThlNDM5OGQyNWQzN2QyYjBlYmIiLCJleHBpcmVzSW4iOjM2MDAsImlhdCI6MTcwMTMzMTI2MiwiZXhwIjoxNzAxMzM0ODYyfQ.WCWJ7whDv9i-p-rgWPkoVnSyY1jmfNrBJHBJ4D8viwo',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get user address',
      apiUrl:
          '${ConnectCarApiGroup.baseUrl}/user-identity-profiles?userId=$userID',
      callType: ApiCallType.GET,
      headers: {
        'Origin': 'https://dev.app.connectcar.cl',
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  dynamic dataID(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
  dynamic phoneNo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].phone''',
      );
  dynamic nationalID(dynamic response) => getJsonField(
        response,
        r'''$.data[:].nationalId''',
      );
  dynamic acceptPrivacyPolicy(dynamic response) => getJsonField(
        response,
        r'''$.data[:].acceptedPrivacyPolicy''',
      );
  dynamic acceptTermCondition(dynamic response) => getJsonField(
        response,
        r'''$.data[:].acceptedTermsAndConditions''',
      );
  dynamic userID(dynamic response) => getJsonField(
        response,
        r'''$.data[:].userId''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].createdAt''',
      );
  dynamic updatedAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].updatedAt''',
      );
  dynamic addressCity(dynamic response) => getJsonField(
        response,
        r'''$.data[:].addressCity''',
      );
  dynamic addressCommune(dynamic response) => getJsonField(
        response,
        r'''$.data[:].addressCommune''',
      );
  dynamic addressRegion(dynamic response) => getJsonField(
        response,
        r'''$.data[:].addressRegion''',
      );
  dynamic addressStreet(dynamic response) => getJsonField(
        response,
        r'''$.data[:].addressStreet''',
      );
}

class PaymentHistoryDetailsCall {
  Future<ApiCallResponse> call({
    String? subscriptionId = '',
    String? authTokenBasic = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Payment history Details',
      apiUrl:
          '${ConnectCarApiGroup.baseUrl}/subscription_invoices?subscriptionId=$subscriptionId',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Basic $authTokenBasic',
        'Content-Type': 'text/plain',
        'Origin': 'https://dev.app.connectcar.cl',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic time(dynamic response) => getJsonField(
        response,
        r'''$.data[:].transactionTime''',
      );
}

/// End connect car api Group Code

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
        'Content-Type': 'application/json',
        'Origin': 'https://dev.app.connectcar.cl',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
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
  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
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
        'token': 'Barear $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }
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
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
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
  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class UserProfileCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'user profile',
      apiUrl: 'https://fastdev.connectcar.cl/users/$userId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
        'Origin': 'https://dev.app.connectcar.cl',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
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
  static dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data.firstname''',
      );
  static dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data.lastname''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.data.email''',
      );
  static dynamic updatesAt(dynamic response) => getJsonField(
        response,
        r'''$.data.updatedAt''',
      );
  static dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.data.createdAt''',
      );
  static dynamic group(dynamic response) => getJsonField(
        response,
        r'''$.data.group''',
      );
  static dynamic organizationId(dynamic response) => getJsonField(
        response,
        r'''$.data.organizationId''',
      );
  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
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
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
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
  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class UserVehicleImageCall {
  static Future<ApiCallResponse> call({
    String? brand = '',
    String? model = '',
    String? version = '',
    String? year = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User Vehicle Image',
      apiUrl:
          'https://fastdev.connectcar.cl/vehicle-images?brand=$brand&model=$model&version=$version&year=$year',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static List<String>? url(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List? docId(dynamic response) => getJsonField(
        response,
        r'''$.data[:].documentId''',
        true,
      ) as List?;
  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class RefreshTokenCall {
  static Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "$refreshToken"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'refresh token',
      apiUrl: 'https://fastdev.connectcar.cl/refresh',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
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
  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class UserIdentityProfilesCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'user identity profiles',
      apiUrl: 'https://fastdev.connectcar.cl/user-identity-profiles',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
        'Origin': 'https://dev.app.connectcar.cl',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
  static dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data[:].phone''',
      );
  static dynamic addressStreet(dynamic response) => getJsonField(
        response,
        r'''$.data[:].addressStreet''',
      );
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class PaymentHistoryCall {
  static Future<ApiCallResponse> call({
    String? subscriptionId = '651c5a3207200eb702baf174',
    String? authToken = 'ZHZhbGVuY2lhQGNvcGVjLmNsOm5pY29NZWxsYSEx',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'payment history',
      apiUrl:
          'https://fastdev.connectcar.cl/subscription_invoices?subscriptionId=$subscriptionId',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Basic $authToken',
        'Content-Type': 'text/plain',
        'Origin': 'https://dev.app.connectcar.cl',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
  static List? paymentHistoryList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
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
