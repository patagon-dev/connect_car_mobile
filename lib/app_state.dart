import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userSessionToken =
          prefs.getString('ff_userSessionToken') ?? _userSessionToken;
    });
    _safeInit(() {
      _userSessionUserId =
          prefs.getString('ff_userSessionUserId') ?? _userSessionUserId;
    });
    _safeInit(() {
      _loginPreferences =
          prefs.getBool('ff_loginPreferences') ?? _loginPreferences;
    });
    _safeInit(() {
      _refreshToken = prefs.getString('ff_refreshToken') ?? _refreshToken;
    });
    _safeInit(() {
      _userSubscriptionID =
          prefs.getString('ff_userSubscriptionID') ?? _userSubscriptionID;
    });
    _safeInit(() {
      _emailPersistent =
          prefs.getString('ff_emailPersistent') ?? _emailPersistent;
    });
    _safeInit(() {
      _passPersistent = prefs.getString('ff_passPersistent') ?? _passPersistent;
    });
    _safeInit(() {
      _rememberCreds = prefs.getBool('ff_rememberCreds') ?? _rememberCreds;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _stepperIndex = 0;
  int get stepperIndex => _stepperIndex;
  set stepperIndex(int value) {
    _stepperIndex = value;
  }

  int _currentTabIndex = 0;
  int get currentTabIndex => _currentTabIndex;
  set currentTabIndex(int value) {
    _currentTabIndex = value;
  }

  String _userSessionToken = '';
  String get userSessionToken => _userSessionToken;
  set userSessionToken(String value) {
    _userSessionToken = value;
    prefs.setString('ff_userSessionToken', value);
  }

  String _userSessionUserId = '';
  String get userSessionUserId => _userSessionUserId;
  set userSessionUserId(String value) {
    _userSessionUserId = value;
    prefs.setString('ff_userSessionUserId', value);
  }

  bool _loginPreferences = false;
  bool get loginPreferences => _loginPreferences;
  set loginPreferences(bool value) {
    _loginPreferences = value;
    prefs.setBool('ff_loginPreferences', value);
  }

  String _signInEmail = '';
  String get signInEmail => _signInEmail;
  set signInEmail(String value) {
    _signInEmail = value;
  }

  String _signInPassword = '';
  String get signInPassword => _signInPassword;
  set signInPassword(String value) {
    _signInPassword = value;
  }

  String _resetEmail = '';
  String get resetEmail => _resetEmail;
  set resetEmail(String value) {
    _resetEmail = value;
  }

  bool _authLoader = false;
  bool get authLoader => _authLoader;
  set authLoader(bool value) {
    _authLoader = value;
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String value) {
    _refreshToken = value;
    prefs.setString('ff_refreshToken', value);
  }

  dynamic _article = jsonDecode(
      '{"subject":"My subject","reply_to":"nmella@cenabast.cl","from":"nmella@cenabast.cl","body":"Help wanted 4!","type":"web","internal":false,"content_type":"text/html"}');
  dynamic get article => _article;
  set article(dynamic value) {
    _article = value;
  }

  List<String> _dateList = [
    'Lunes 13 de Noviembre',
    'Martes  14 de Noviembre',
    'Miércoles 15 de Noviembre ',
    'Jueves 16 de Noviembre',
    'Viernes 17 de Noviembre'
  ];
  List<String> get dateList => _dateList;
  set dateList(List<String> value) {
    _dateList = value;
  }

  void addToDateList(String value) {
    _dateList.add(value);
  }

  void removeFromDateList(String value) {
    _dateList.remove(value);
  }

  void removeAtIndexFromDateList(int index) {
    _dateList.removeAt(index);
  }

  void updateDateListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _dateList[index] = updateFn(_dateList[index]);
  }

  void insertAtIndexInDateList(int index, String value) {
    _dateList.insert(index, value);
  }

  dynamic _carImage = jsonDecode(
      '{"data":[{"url":"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/connect-car-v1-2i59cm/assets/shbt25lwpskw/car_1.png"}]}');
  dynamic get carImage => _carImage;
  set carImage(dynamic value) {
    _carImage = value;
  }

  String _userSubscriptionID = '';
  String get userSubscriptionID => _userSubscriptionID;
  set userSubscriptionID(String value) {
    _userSubscriptionID = value;
    prefs.setString('ff_userSubscriptionID', value);
  }

  int _minsToRefresh = 0;
  int get minsToRefresh => _minsToRefresh;
  set minsToRefresh(int value) {
    _minsToRefresh = value;
  }

  String _dropdown4 = '';
  String get dropdown4 => _dropdown4;
  set dropdown4(String value) {
    _dropdown4 = value;
  }

  String _signBase64String = '';
  String get signBase64String => _signBase64String;
  set signBase64String(String value) {
    _signBase64String = value;
  }

  List<RegionModelStruct> _Regions = [
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Arica y Parinacota","romanNumber":"XV","number":"15","id":"AP","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Arica\\\\\\",\\\\\\"id\\\\\\":\\\\\\"arica\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Camarones\\\\\\",\\\\\\"id\\\\\\":\\\\\\"camarones\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"General Lagos\\\\\\",\\\\\\"id\\\\\\":\\\\\\"general-lagos\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Putre\\\\\\",\\\\\\"id\\\\\\":\\\\\\"putre\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Tarapacá","romanNumber":"I","number":"1","id":"TA","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Alto Hospicio\\\\\\",\\\\\\"id\\\\\\":\\\\\\"alto-hospicio\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Camiña\\\\\\",\\\\\\"id\\\\\\":\\\\\\"camina\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Colchane\\\\\\",\\\\\\"id\\\\\\":\\\\\\"colchane\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Huara\\\\\\",\\\\\\"id\\\\\\":\\\\\\"huara\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Iquique\\\\\\",\\\\\\"id\\\\\\":\\\\\\"iquique\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pica\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pica\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pozo Almonte\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pozo-almonte\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Antofagasta","romanNumber":"II","number":"2","id":"AN","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Antofagasta\\\\\\",\\\\\\"id\\\\\\":\\\\\\"antofagasta\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Calama\\\\\\",\\\\\\"id\\\\\\":\\\\\\"calama\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"María Elena\\\\\\",\\\\\\"id\\\\\\":\\\\\\"maria-elena\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Mejillones\\\\\\",\\\\\\"id\\\\\\":\\\\\\"mejillones\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Ollagüe\\\\\\",\\\\\\"id\\\\\\":\\\\\\"ollague\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Pedro de Atacama\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-pedro-de-atacama\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Sierra Gorda\\\\\\",\\\\\\"id\\\\\\":\\\\\\"sierra-gorda\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Taltal\\\\\\",\\\\\\"id\\\\\\":\\\\\\"taltal\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Tocopilla\\\\\\",\\\\\\"id\\\\\\":\\\\\\"tocopilla\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Atacama","romanNumber":"III","number":"3","id":"AT","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Alto del Carmen\\\\\\",\\\\\\"id\\\\\\":\\\\\\"alto-del-carmen\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Caldera\\\\\\",\\\\\\"id\\\\\\":\\\\\\"caldera\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Chañaral\\\\\\",\\\\\\"id\\\\\\":\\\\\\"chanaral\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Copiapó\\\\\\",\\\\\\"id\\\\\\":\\\\\\"copiapo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Diego de Almagro\\\\\\",\\\\\\"id\\\\\\":\\\\\\"diego-de-almagro\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Freirina\\\\\\",\\\\\\"id\\\\\\":\\\\\\"freirina\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Huasco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"huasco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Tierra Amarilla\\\\\\",\\\\\\"id\\\\\\":\\\\\\"tierra-amarilla\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Vallenar\\\\\\",\\\\\\"id\\\\\\":\\\\\\"vallenar\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Coquimbo","romanNumber":"IV","number":"4","id":"CO","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Andacollo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"andacollo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Canela\\\\\\",\\\\\\"id\\\\\\":\\\\\\"canela\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Combarbalá\\\\\\",\\\\\\"id\\\\\\":\\\\\\"combarbala\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Coquimbo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"coquimbo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Illapel\\\\\\",\\\\\\"id\\\\\\":\\\\\\"illapel\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"La Higuera\\\\\\",\\\\\\"id\\\\\\":\\\\\\"la-higuera\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"La Serena\\\\\\",\\\\\\"id\\\\\\":\\\\\\"la-serena\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Los Vilos\\\\\\",\\\\\\"id\\\\\\":\\\\\\"los-vilos\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Monte Patria\\\\\\",\\\\\\"id\\\\\\":\\\\\\"monte-patria\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Ovalle\\\\\\",\\\\\\"id\\\\\\":\\\\\\"ovalle\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Paiguano\\\\\\",\\\\\\"id\\\\\\":\\\\\\"paiguano\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Punitaqui\\\\\\",\\\\\\"id\\\\\\":\\\\\\"punitaqui\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Río Hurtado\\\\\\",\\\\\\"id\\\\\\":\\\\\\"rio-hurtado\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Salamanca\\\\\\",\\\\\\"id\\\\\\":\\\\\\"salamanca\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Vicuña\\\\\\",\\\\\\"id\\\\\\":\\\\\\"vicuna\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Valparaíso","romanNumber":"V","number":"5","id":"VA","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Algarrobo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"algarrobo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cabildo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cabildo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Calera\\\\\\",\\\\\\"id\\\\\\":\\\\\\"calera\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Calle Larga\\\\\\",\\\\\\"id\\\\\\":\\\\\\"calle-larga\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cartagena\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cartagena\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Casablanca\\\\\\",\\\\\\"id\\\\\\":\\\\\\"casablanca\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Catemu\\\\\\",\\\\\\"id\\\\\\":\\\\\\"catemu\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Concón\\\\\\",\\\\\\"id\\\\\\":\\\\\\"concon\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"El Quisco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"el-quisco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"El Tabo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"el-tabo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Hijuelas\\\\\\",\\\\\\"id\\\\\\":\\\\\\"hijuelas\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Isla de Pascua\\\\\\",\\\\\\"id\\\\\\":\\\\\\"isla-de-pascua\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Juan Fernández\\\\\\",\\\\\\"id\\\\\\":\\\\\\"juan-fernandez\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"La Cruz\\\\\\",\\\\\\"id\\\\\\":\\\\\\"la-cruz\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"La Ligua\\\\\\",\\\\\\"id\\\\\\":\\\\\\"la-ligua\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Limache\\\\\\",\\\\\\"id\\\\\\":\\\\\\"limache\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Llaillay\\\\\\",\\\\\\"id\\\\\\":\\\\\\"llaillay\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Los Andes\\\\\\",\\\\\\"id\\\\\\":\\\\\\"los-andes\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Nogales\\\\\\",\\\\\\"id\\\\\\":\\\\\\"nogales\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Olmué\\\\\\",\\\\\\"id\\\\\\":\\\\\\"olmue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Panquehue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"panquehue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Papudo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"papudo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Petorca\\\\\\",\\\\\\"id\\\\\\":\\\\\\"petorca\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Puchuncaví\\\\\\",\\\\\\"id\\\\\\":\\\\\\"puchuncavi\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Putaendo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"putaendo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quillota\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quillota\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quilpué\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quilpue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quintero\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quintero\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Rinconada\\\\\\",\\\\\\"id\\\\\\":\\\\\\"rinconada\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Antonio\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-antonio\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Esteban\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-esteban\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Felipe\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-felipe\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Santa María\\\\\\",\\\\\\"id\\\\\\":\\\\\\"santa-maria\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Santo Domingo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"santo-domingo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Valparaíso\\\\\\",\\\\\\"id\\\\\\":\\\\\\"valparaiso\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Villa Alemana\\\\\\",\\\\\\"id\\\\\\":\\\\\\"villa-alemana\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Viña del Mar\\\\\\",\\\\\\"id\\\\\\":\\\\\\"vina-del-mar\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Zapallar\\\\\\",\\\\\\"id\\\\\\":\\\\\\"zapallar\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Metropolitana de Santiago","romanNumber":"XIII","number":"13","id":"RM","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Alhué\\\\\\",\\\\\\"id\\\\\\":\\\\\\"alhue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Buin\\\\\\",\\\\\\"id\\\\\\":\\\\\\"buin\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Calera de Tango\\\\\\",\\\\\\"id\\\\\\":\\\\\\"calera-de-tango\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cerrillos\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cerrillos\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cerro Navia\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cerro-navia\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Colina\\\\\\",\\\\\\"id\\\\\\":\\\\\\"colina\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Conchalí\\\\\\",\\\\\\"id\\\\\\":\\\\\\"conchali\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Curacaví\\\\\\",\\\\\\"id\\\\\\":\\\\\\"curacavi\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"El Bosque\\\\\\",\\\\\\"id\\\\\\":\\\\\\"el-bosque\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"El Monte\\\\\\",\\\\\\"id\\\\\\":\\\\\\"el-monte\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Estación Central\\\\\\",\\\\\\"id\\\\\\":\\\\\\"estacion-central\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Huechuraba\\\\\\",\\\\\\"id\\\\\\":\\\\\\"huechuraba\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Independencia\\\\\\",\\\\\\"id\\\\\\":\\\\\\"independencia\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Isla de Maipo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"isla-de-maipo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"La Cisterna\\\\\\",\\\\\\"id\\\\\\":\\\\\\"la-cisterna\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"La Florida\\\\\\",\\\\\\"id\\\\\\":\\\\\\"la-florida\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"La Granja\\\\\\",\\\\\\"id\\\\\\":\\\\\\"la-granja\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"La Pintana\\\\\\",\\\\\\"id\\\\\\":\\\\\\"la-pintana\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"La Reina\\\\\\",\\\\\\"id\\\\\\":\\\\\\"la-reina\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lampa\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lampa\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Las Condes\\\\\\",\\\\\\"id\\\\\\":\\\\\\"las-condes\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lo Barnechea\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lo-barnechea\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lo Espejo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lo-espejo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lo Prado\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lo-prado\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Macul\\\\\\",\\\\\\"id\\\\\\":\\\\\\"macul\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Maipú\\\\\\",\\\\\\"id\\\\\\":\\\\\\"maipu\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"María Pinto\\\\\\",\\\\\\"id\\\\\\":\\\\\\"maria-pinto\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Melipilla\\\\\\",\\\\\\"id\\\\\\":\\\\\\"melipilla\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Ñuñoa\\\\\\",\\\\\\"id\\\\\\":\\\\\\"nunoa\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Padre Hurtado\\\\\\",\\\\\\"id\\\\\\":\\\\\\"padre-hurtado\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Paine\\\\\\",\\\\\\"id\\\\\\":\\\\\\"paine\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pedro Aguirre Cerda\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pedro-aguirre-cerda\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Peñaflor\\\\\\",\\\\\\"id\\\\\\":\\\\\\"penaflor\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Peñalolén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"penalolen\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pirque\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pirque\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Providencia\\\\\\",\\\\\\"id\\\\\\":\\\\\\"providencia\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pudahuel\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pudahuel\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Puente Alto\\\\\\",\\\\\\"id\\\\\\":\\\\\\"puente-alto\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quilicura\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quilicura\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quinta Normal\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quinta-normal\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Recoleta\\\\\\",\\\\\\"id\\\\\\":\\\\\\"recoleta\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Renca\\\\\\",\\\\\\"id\\\\\\":\\\\\\"renca\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Bernardo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-bernardo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Joaquín\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-joaquin\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San José de Maipo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-jose-de-maipo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Miguel\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-miguel\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Pedro\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-pedro\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Ramón\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-ramon\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Santiago\\\\\\",\\\\\\"id\\\\\\":\\\\\\"santiago\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Talagante\\\\\\",\\\\\\"id\\\\\\":\\\\\\"talagante\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Tiltil\\\\\\",\\\\\\"id\\\\\\":\\\\\\"tiltil\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Vitacura\\\\\\",\\\\\\"id\\\\\\":\\\\\\"vitacura\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Libertador Gral. Bernardo O’Higgins","romanNumber":"VI","number":"6","id":"LI","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Chimbarongo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"chimbarongo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Chépica\\\\\\",\\\\\\"id\\\\\\":\\\\\\"chepica\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Codegua\\\\\\",\\\\\\"id\\\\\\":\\\\\\"codegua\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Coinco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"coinco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Coltauco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"coltauco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Doñihue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"donihue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Graneros\\\\\\",\\\\\\"id\\\\\\":\\\\\\"graneros\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"La Estrella\\\\\\",\\\\\\"id\\\\\\":\\\\\\"la-estrella\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Las Cabras\\\\\\",\\\\\\"id\\\\\\":\\\\\\"las-cabras\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Litueche\\\\\\",\\\\\\"id\\\\\\":\\\\\\"litueche\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lolol\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lolol\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Machalí\\\\\\",\\\\\\"id\\\\\\":\\\\\\"machali\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Malloa\\\\\\",\\\\\\"id\\\\\\":\\\\\\"malloa\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Marchihue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"marchihue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Nancagua\\\\\\",\\\\\\"id\\\\\\":\\\\\\"nancagua\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Navidad\\\\\\",\\\\\\"id\\\\\\":\\\\\\"navidad\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Olivar\\\\\\",\\\\\\"id\\\\\\":\\\\\\"olivar\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Mostazal\\\\\\",\\\\\\"id\\\\\\":\\\\\\"mostazal\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Palmilla\\\\\\",\\\\\\"id\\\\\\":\\\\\\"palmilla\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Paredones\\\\\\",\\\\\\"id\\\\\\":\\\\\\"paredones\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Peralillo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"peralillo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Peumo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"peumo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pichidegua\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pichidegua\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pichilemu\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pichilemu\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Placilla\\\\\\",\\\\\\"id\\\\\\":\\\\\\"placilla\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pumanque\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pumanque\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quinta de Tilcoco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quinta-de-tilcoco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Rancagua\\\\\\",\\\\\\"id\\\\\\":\\\\\\"rancagua\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Rengo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"rengo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Requínoa\\\\\\",\\\\\\"id\\\\\\":\\\\\\"requinoa\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Fernando\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-fernando\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Vicente\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-vicente\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Santa Cruz\\\\\\",\\\\\\"id\\\\\\":\\\\\\"santa-cruz\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Maule","romanNumber":"VII","number":"7","id":"ML","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Cauquenes\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cauquenes\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Chanco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"chanco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Colbún\\\\\\",\\\\\\"id\\\\\\":\\\\\\"colbun\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Constitución\\\\\\",\\\\\\"id\\\\\\":\\\\\\"constitucion\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Curepto\\\\\\",\\\\\\"id\\\\\\":\\\\\\"curepto\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Curicó\\\\\\",\\\\\\"id\\\\\\":\\\\\\"curico\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Empedrado\\\\\\",\\\\\\"id\\\\\\":\\\\\\"empedrado\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Hualañé\\\\\\",\\\\\\"id\\\\\\":\\\\\\"hualane\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Licantén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"licanten\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Linares\\\\\\",\\\\\\"id\\\\\\":\\\\\\"linares\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Longaví\\\\\\",\\\\\\"id\\\\\\":\\\\\\"longavi\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Maule\\\\\\",\\\\\\"id\\\\\\":\\\\\\"maule\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Molina\\\\\\",\\\\\\"id\\\\\\":\\\\\\"molina\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Parral\\\\\\",\\\\\\"id\\\\\\":\\\\\\"parral\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pelarco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pelarco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pelluhue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pelluhue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pencahue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pencahue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Rauco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"rauco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Retiro\\\\\\",\\\\\\"id\\\\\\":\\\\\\"retiro\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Romeral\\\\\\",\\\\\\"id\\\\\\":\\\\\\"romeral\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Río Claro\\\\\\",\\\\\\"id\\\\\\":\\\\\\"rio-claro\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Sagrada Familia\\\\\\",\\\\\\"id\\\\\\":\\\\\\"sagrada-familia\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Clemente\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-clemente\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Javier de Loncomilla\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-javier-de-loncomilla\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Rafael\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-rafael\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Talca\\\\\\",\\\\\\"id\\\\\\":\\\\\\"talca\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Teno\\\\\\",\\\\\\"id\\\\\\":\\\\\\"teno\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Vichuquén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"vichuquen\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Villa Alegre\\\\\\",\\\\\\"id\\\\\\":\\\\\\"villa-alegre\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Yerbas Buenas\\\\\\",\\\\\\"id\\\\\\":\\\\\\"yerbas-buenas\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Ñuble","romanNumber":"XVI","number":"16","id":"NB","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Bulnes\\\\\\",\\\\\\"id\\\\\\":\\\\\\"bulnes\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Chillán Viejo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"chillan-viejo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Chillán\\\\\\",\\\\\\"id\\\\\\":\\\\\\"chillan\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cobquecura\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cobquecura\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Coelemu\\\\\\",\\\\\\"id\\\\\\":\\\\\\"coelemu\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Coihueco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"coihueco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"El Carmen\\\\\\",\\\\\\"id\\\\\\":\\\\\\"el-carmen\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Ninhue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"ninhue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Ñiquén \\\\\\",\\\\\\"id\\\\\\":\\\\\\"niquen\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pemuco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pemuco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pinto\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pinto\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Portezuelo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"portezuelo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quillón\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quillon\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quirihue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quirihue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Ránquil\\\\\\",\\\\\\"id\\\\\\":\\\\\\"ranquil\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Carlos\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-carlos\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Fabián\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-fabian\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Ignacio\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-ignacio\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Nicolás\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-nicolas\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Treguaco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"treguaco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Yungay\\\\\\",\\\\\\"id\\\\\\":\\\\\\"yungay\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Biobío","romanNumber":"VIII","number":"8","id":"BI","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Alto Biobío\\\\\\",\\\\\\"id\\\\\\":\\\\\\"alto-biobio\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Antuco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"antuco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Arauco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"arauco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cabrero\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cabrero\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cañete\\\\\\",\\\\\\"id\\\\\\":\\\\\\"canete\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Chiguayante\\\\\\",\\\\\\"id\\\\\\":\\\\\\"chiguayante\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Concepción\\\\\\",\\\\\\"id\\\\\\":\\\\\\"concepcion\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Contulmo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"contulmo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Coronel\\\\\\",\\\\\\"id\\\\\\":\\\\\\"coronel\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Curanilahue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"curanilahue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Florida\\\\\\",\\\\\\"id\\\\\\":\\\\\\"florida\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Hualpén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"hualpen\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Hualqui\\\\\\",\\\\\\"id\\\\\\":\\\\\\"hualqui\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Laja\\\\\\",\\\\\\"id\\\\\\":\\\\\\"laja\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lebu\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lebu\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Los Álamos\\\\\\",\\\\\\"id\\\\\\":\\\\\\"los-alamos\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Los Ángeles\\\\\\",\\\\\\"id\\\\\\":\\\\\\"los-angeles\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lota\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lota\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Mulchén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"mulchen\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Nacimiento\\\\\\",\\\\\\"id\\\\\\":\\\\\\"nacimiento\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Negrete\\\\\\",\\\\\\"id\\\\\\":\\\\\\"negrete\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Penco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"penco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quilaco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quilaco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quilleco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quilleco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Pedro de la Paz\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-pedro-de-la-paz\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Rosendo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-rosendo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Santa Bárbara\\\\\\",\\\\\\"id\\\\\\":\\\\\\"santa-barbara\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Santa Juana\\\\\\",\\\\\\"id\\\\\\":\\\\\\"santa-juana\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Talcahuano\\\\\\",\\\\\\"id\\\\\\":\\\\\\"talcahuano\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Tirúa\\\\\\",\\\\\\"id\\\\\\":\\\\\\"tirua\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Tomé\\\\\\",\\\\\\"id\\\\\\":\\\\\\"tome\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Tucapel\\\\\\",\\\\\\"id\\\\\\":\\\\\\"tucapel\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Yumbel\\\\\\",\\\\\\"id\\\\\\":\\\\\\"yumbel\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Araucanía","romanNumber":"IX","number":"9","id":"AR","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Angol\\\\\\",\\\\\\"id\\\\\\":\\\\\\"angol\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Carahue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"carahue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cholchol\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cholchol\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Collipulli\\\\\\",\\\\\\"id\\\\\\":\\\\\\"collipulli\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cunco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cunco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Curacautín\\\\\\",\\\\\\"id\\\\\\":\\\\\\"curacautin\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Curarrehue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"curarrehue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Ercilla\\\\\\",\\\\\\"id\\\\\\":\\\\\\"ercilla\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Freire\\\\\\",\\\\\\"id\\\\\\":\\\\\\"freire\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Galvarino\\\\\\",\\\\\\"id\\\\\\":\\\\\\"galvarino\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Gorbea\\\\\\",\\\\\\"id\\\\\\":\\\\\\"gorbea\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lautaro\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lautaro\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Loncoche\\\\\\",\\\\\\"id\\\\\\":\\\\\\"loncoche\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lonquimay\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lonquimay\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Los Sauces\\\\\\",\\\\\\"id\\\\\\":\\\\\\"los-sauces\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lumaco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lumaco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Melipeuco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"melipeuco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Nueva Imperial\\\\\\",\\\\\\"id\\\\\\":\\\\\\"nueva-imperial\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Padre las Casas\\\\\\",\\\\\\"id\\\\\\":\\\\\\"padre-las-casas\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Perquenco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"perquenco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pitrufquén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pitrufquen\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Pucón\\\\\\",\\\\\\"id\\\\\\":\\\\\\"pucon\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Purén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"puren\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Renaico\\\\\\",\\\\\\"id\\\\\\":\\\\\\"renaico\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Saavedra\\\\\\",\\\\\\"id\\\\\\":\\\\\\"saavedra\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Temuco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"temuco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Teodoro Schmidt\\\\\\",\\\\\\"id\\\\\\":\\\\\\"teodoro-schmidt\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Toltén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"tolten\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Traiguén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"traiguen\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Victoria\\\\\\",\\\\\\"id\\\\\\":\\\\\\"victoria\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Vilcún\\\\\\",\\\\\\"id\\\\\\":\\\\\\"vilcun\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Villarrica\\\\\\",\\\\\\"id\\\\\\":\\\\\\"villarrica\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Los Ríos","romanNumber":"XIV","number":"14","id":"LR","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Corral\\\\\\",\\\\\\"id\\\\\\":\\\\\\"corral\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Futrono\\\\\\",\\\\\\"id\\\\\\":\\\\\\"futrono\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"La Unión\\\\\\",\\\\\\"id\\\\\\":\\\\\\"la-union\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lago Ranco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lago-ranco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lanco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lanco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Los Lagos\\\\\\",\\\\\\"id\\\\\\":\\\\\\"los-lagos\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Mariquina\\\\\\",\\\\\\"id\\\\\\":\\\\\\"mariquina\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Máfil\\\\\\",\\\\\\"id\\\\\\":\\\\\\"mafil\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Paillaco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"paillaco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Panguipulli\\\\\\",\\\\\\"id\\\\\\":\\\\\\"panguipulli\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Río Bueno\\\\\\",\\\\\\"id\\\\\\":\\\\\\"rio-bueno\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Valdivia\\\\\\",\\\\\\"id\\\\\\":\\\\\\"valdivia\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Los Lagos","romanNumber":"X","number":"10","id":"LL","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Ancud\\\\\\",\\\\\\"id\\\\\\":\\\\\\"ancud\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Calbuco\\\\\\",\\\\\\"id\\\\\\":\\\\\\"calbuco\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Castro\\\\\\",\\\\\\"id\\\\\\":\\\\\\"castro\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Chaitén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"chaiten\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Chonchi\\\\\\",\\\\\\"id\\\\\\":\\\\\\"chonchi\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cochamó\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cochamo\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Curaco de Vélez\\\\\\",\\\\\\"id\\\\\\":\\\\\\"curaco-de-velez\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Dalcahue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"dalcahue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Fresia\\\\\\",\\\\\\"id\\\\\\":\\\\\\"fresia\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Frutillar\\\\\\",\\\\\\"id\\\\\\":\\\\\\"frutillar\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Futaleufú\\\\\\",\\\\\\"id\\\\\\":\\\\\\"futaleufu\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Hualaihué\\\\\\",\\\\\\"id\\\\\\":\\\\\\"hualaihue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Llanquihue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"llanquihue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Los Muermos\\\\\\",\\\\\\"id\\\\\\":\\\\\\"los-muermos\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Maullín\\\\\\",\\\\\\"id\\\\\\":\\\\\\"maullin\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Osorno\\\\\\",\\\\\\"id\\\\\\":\\\\\\"osorno\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Palena\\\\\\",\\\\\\"id\\\\\\":\\\\\\"palena\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Puerto Montt\\\\\\",\\\\\\"id\\\\\\":\\\\\\"puerto-montt\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Puerto Octay\\\\\\",\\\\\\"id\\\\\\":\\\\\\"puerto-octay\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Puerto Varas\\\\\\",\\\\\\"id\\\\\\":\\\\\\"puerto-varas\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Puqueldón\\\\\\",\\\\\\"id\\\\\\":\\\\\\"puqueldon\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Purranque\\\\\\",\\\\\\"id\\\\\\":\\\\\\"purranque\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Puyehue\\\\\\",\\\\\\"id\\\\\\":\\\\\\"puyehue\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Queilén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"queilen\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quellón\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quellon\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quemchi\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quemchi\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Quinchao\\\\\\",\\\\\\"id\\\\\\":\\\\\\"quinchao\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Río Negro\\\\\\",\\\\\\"id\\\\\\":\\\\\\"rio-negro\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Juan de la Costa\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-juan-de-la-costa\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Pablo\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-pablo\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Aisén del Gral. Carlos Ibáñez del Campo","romanNumber":"XI","number":"11","id":"AI","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Aysén\\\\\\",\\\\\\"id\\\\\\":\\\\\\"aysen\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Chile Chico\\\\\\",\\\\\\"id\\\\\\":\\\\\\"chile-chico\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cisnes\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cisnes\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cochrane\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cochrane\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Coyhaique\\\\\\",\\\\\\"id\\\\\\":\\\\\\"coyhaique\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Guaitecas\\\\\\",\\\\\\"id\\\\\\":\\\\\\"guaitecas\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Lago Verde\\\\\\",\\\\\\"id\\\\\\":\\\\\\"lago-verde\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"O’Higgins\\\\\\",\\\\\\"id\\\\\\":\\\\\\"o’higgins\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Río Ibáñez\\\\\\",\\\\\\"id\\\\\\":\\\\\\"rio-ibanez\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Tortel\\\\\\",\\\\\\"id\\\\\\":\\\\\\"tortel\\\\\\"}\\"]"}')),
    RegionModelStruct.fromSerializableMap(jsonDecode(
        '{"name":"Magallanes y de la Antártica Chilena","romanNumber":"XII","number":"12","id":"MA","communes":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Antártica\\\\\\",\\\\\\"id\\\\\\":\\\\\\"antartica\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Cabo de Hornos\\\\\\",\\\\\\"id\\\\\\":\\\\\\"cabo-de-hornos\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Laguna Blanca\\\\\\",\\\\\\"id\\\\\\":\\\\\\"laguna-blanca\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Natales\\\\\\",\\\\\\"id\\\\\\":\\\\\\"natales\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Porvenir\\\\\\",\\\\\\"id\\\\\\":\\\\\\"porvenir\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Primavera\\\\\\",\\\\\\"id\\\\\\":\\\\\\"primavera\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Punta Arenas\\\\\\",\\\\\\"id\\\\\\":\\\\\\"punta-arenas\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Río Verde\\\\\\",\\\\\\"id\\\\\\":\\\\\\"rio-verde\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"San Gregorio\\\\\\",\\\\\\"id\\\\\\":\\\\\\"san-gregorio\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Timaukel\\\\\\",\\\\\\"id\\\\\\":\\\\\\"timaukel\\\\\\"}\\",\\"{\\\\\\"name\\\\\\":\\\\\\"Torres del Paine\\\\\\",\\\\\\"id\\\\\\":\\\\\\"torres-del-paine\\\\\\"}\\"]"}'))
  ];
  List<RegionModelStruct> get Regions => _Regions;
  set Regions(List<RegionModelStruct> value) {
    _Regions = value;
  }

  void addToRegions(RegionModelStruct value) {
    _Regions.add(value);
  }

  void removeFromRegions(RegionModelStruct value) {
    _Regions.remove(value);
  }

  void removeAtIndexFromRegions(int index) {
    _Regions.removeAt(index);
  }

  void updateRegionsAtIndex(
    int index,
    RegionModelStruct Function(RegionModelStruct) updateFn,
  ) {
    _Regions[index] = updateFn(_Regions[index]);
  }

  void insertAtIndexInRegions(int index, RegionModelStruct value) {
    _Regions.insert(index, value);
  }

  SelectedCarDetailModelStruct _selectedCarModel =
      SelectedCarDetailModelStruct();
  SelectedCarDetailModelStruct get selectedCarModel => _selectedCarModel;
  set selectedCarModel(SelectedCarDetailModelStruct value) {
    _selectedCarModel = value;
  }

  void updateSelectedCarModelStruct(
      Function(SelectedCarDetailModelStruct) updateFn) {
    updateFn(_selectedCarModel);
  }

  String _emailPersistent = '';
  String get emailPersistent => _emailPersistent;
  set emailPersistent(String value) {
    _emailPersistent = value;
    prefs.setString('ff_emailPersistent', value);
  }

  String _passPersistent = '';
  String get passPersistent => _passPersistent;
  set passPersistent(String value) {
    _passPersistent = value;
    prefs.setString('ff_passPersistent', value);
  }

  bool _rememberCreds = false;
  bool get rememberCreds => _rememberCreds;
  set rememberCreds(bool value) {
    _rememberCreds = value;
    prefs.setBool('ff_rememberCreds', value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
