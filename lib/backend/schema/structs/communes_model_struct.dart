// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CommunesModelStruct extends FFFirebaseStruct {
  CommunesModelStruct({
    String? name,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _id = id,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static CommunesModelStruct fromMap(Map<String, dynamic> data) =>
      CommunesModelStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
      );

  static CommunesModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CommunesModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static CommunesModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommunesModelStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CommunesModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommunesModelStruct && name == other.name && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([name, id]);
}

CommunesModelStruct createCommunesModelStruct({
  String? name,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommunesModelStruct(
      name: name,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommunesModelStruct? updateCommunesModelStruct(
  CommunesModelStruct? communesModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    communesModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommunesModelStructData(
  Map<String, dynamic> firestoreData,
  CommunesModelStruct? communesModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (communesModel == null) {
    return;
  }
  if (communesModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && communesModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final communesModelData =
      getCommunesModelFirestoreData(communesModel, forFieldValue);
  final nestedData =
      communesModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = communesModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommunesModelFirestoreData(
  CommunesModelStruct? communesModel, [
  bool forFieldValue = false,
]) {
  if (communesModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(communesModel.toMap());

  // Add any Firestore field values
  communesModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommunesModelListFirestoreData(
  List<CommunesModelStruct>? communesModels,
) =>
    communesModels
        ?.map((e) => getCommunesModelFirestoreData(e, true))
        .toList() ??
    [];
