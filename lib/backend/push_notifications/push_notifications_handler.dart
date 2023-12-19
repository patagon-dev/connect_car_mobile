import 'dart:async';

import 'serialization_util.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'car_crash_form_NOT_ACTUAL': ParameterData.none(),
  'profile_page': ParameterData.none(),
  'login': ParameterData.none(),
  'reset_password': ParameterData.none(),
  'reset_password_verification': ParameterData.none(),
  'suscripciones': ParameterData.none(),
  'suscripciones_details': (data) async => ParameterData(
        allParams: {
          'brand': getParameter<String>(data, 'brand'),
          'model': getParameter<String>(data, 'model'),
          'version': getParameter<String>(data, 'version'),
          'licensePlate': getParameter<String>(data, 'licensePlate'),
          'subscriptionID': getParameter<String>(data, 'subscriptionID'),
        },
      ),
  'schedule_maintenance': (data) async => ParameterData(
        allParams: {
          'brand': getParameter<String>(data, 'brand'),
          'model': getParameter<String>(data, 'model'),
          'licensePlate': getParameter<String>(data, 'licensePlate'),
          'version': getParameter<String>(data, 'version'),
        },
      ),
  'maintenance_scheduling': (data) async => ParameterData(
        allParams: {
          'scheduleDate': getParameter<String>(data, 'scheduleDate'),
        },
      ),
  'roadside_assistance_page': ParameterData.none(),
  'car_wash': ParameterData.none(),
  'tire_change': ParameterData.none(),
  'low_battery': ParameterData.none(),
  'fuel_replacement': ParameterData.none(),
  'door_opening': ParameterData.none(),
  'other_unforeseen_events': ParameterData.none(),
  'crane_service': ParameterData.none(),
  'Light_mechanics': ParameterData.none(),
  'LogInPage': ParameterData.none(),
  'ResetPage': ParameterData.none(),
  'ResetPasswordSuccess': ParameterData.none(),
  'car_crash_formCopy': ParameterData.none(),
  'test': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
