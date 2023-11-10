import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

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
}

class UserSuspcriptionsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User Suspcriptions',
      apiUrl: 'https://fastdev.connectcar.cl/subscriptions',
      callType: ApiCallType.GET,
      headers: {
        'Origin': 'https://dev.app.connectcar.cl',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NTRhNThlNDM5OGQyNWQzN2QyYjBlYmIiLCJpYXQiOjE2OTk1NzA2ODMsImV4cCI6MTY5OTU3NDI4M30.AcN7M8IgZszxSewVBhaPvjL9QbVyZ8c5NeflLHmxPKU',
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
}

class UserInfoCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'User Info',
      apiUrl: 'https://fastdev.connectcar.cl/users/631f9378dfbb0218cfe725cf',
      callType: ApiCallType.GET,
      headers: {
        'Origin': 'https://dev.app.connectcar.cl',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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
