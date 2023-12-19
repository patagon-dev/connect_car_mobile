// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegionModelStruct extends FFFirebaseStruct {
  RegionModelStruct({
    String? name,
    String? romanNumber,
    String? number,
    String? id,
    List<CommunesModelStruct>? communes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _romanNumber = romanNumber,
        _number = number,
        _id = id,
        _communes = communes,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "romanNumber" field.
  String? _romanNumber;
  String get romanNumber => _romanNumber ?? '';
  set romanNumber(String? val) => _romanNumber = val;
  bool hasRomanNumber() => _romanNumber != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  set number(String? val) => _number = val;
  bool hasNumber() => _number != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "communes" field.
  List<CommunesModelStruct>? _communes;
  List<CommunesModelStruct> get communes => _communes ?? const [];
  set communes(List<CommunesModelStruct>? val) => _communes = val;
  void updateCommunes(Function(List<CommunesModelStruct>) updateFn) =>
      updateFn(_communes ??= []);
  bool hasCommunes() => _communes != null;

  static RegionModelStruct fromMap(Map<String, dynamic> data) =>
      RegionModelStruct(
        name: data['name'] as String?,
        romanNumber: data['romanNumber'] as String?,
        number: data['number'] as String?,
        id: data['id'] as String?,
        communes: getStructList(
          data['communes'],
          CommunesModelStruct.fromMap,
        ),
      );

  static RegionModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RegionModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'romanNumber': _romanNumber,
        'number': _number,
        'id': _id,
        'communes': _communes?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'romanNumber': serializeParam(
          _romanNumber,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'communes': serializeParam(
          _communes,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static RegionModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      RegionModelStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        romanNumber: deserializeParam(
          data['romanNumber'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        communes: deserializeStructParam<CommunesModelStruct>(
          data['communes'],
          ParamType.DataStruct,
          true,
          structBuilder: CommunesModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'RegionModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RegionModelStruct &&
        name == other.name &&
        romanNumber == other.romanNumber &&
        number == other.number &&
        id == other.id &&
        listEquality.equals(communes, other.communes);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, romanNumber, number, id, communes]);
}

RegionModelStruct createRegionModelStruct({
  String? name,
  String? romanNumber,
  String? number,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RegionModelStruct(
      name: name,
      romanNumber: romanNumber,
      number: number,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RegionModelStruct? updateRegionModelStruct(
  RegionModelStruct? regionModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    regionModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRegionModelStructData(
  Map<String, dynamic> firestoreData,
  RegionModelStruct? regionModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (regionModel == null) {
    return;
  }
  if (regionModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && regionModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final regionModelData =
      getRegionModelFirestoreData(regionModel, forFieldValue);
  final nestedData =
      regionModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = regionModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRegionModelFirestoreData(
  RegionModelStruct? regionModel, [
  bool forFieldValue = false,
]) {
  if (regionModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(regionModel.toMap());

  // Add any Firestore field values
  regionModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRegionModelListFirestoreData(
  List<RegionModelStruct>? regionModels,
) =>
    regionModels?.map((e) => getRegionModelFirestoreData(e, true)).toList() ??
    [];
