// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProfileModelStruct extends FFFirebaseStruct {
  ProfileModelStruct({
    String? firstname,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firstname = firstname,
        super(firestoreUtilData);

  // "firstname" field.
  String? _firstname;
  String get firstname => _firstname ?? '';
  set firstname(String? val) => _firstname = val;
  bool hasFirstname() => _firstname != null;

  static ProfileModelStruct fromMap(Map<String, dynamic> data) =>
      ProfileModelStruct(
        firstname: data['firstname'] as String?,
      );

  static ProfileModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ProfileModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'firstname': _firstname,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'firstname': serializeParam(
          _firstname,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProfileModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileModelStruct(
        firstname: deserializeParam(
          data['firstname'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProfileModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileModelStruct && firstname == other.firstname;
  }

  @override
  int get hashCode => const ListEquality().hash([firstname]);
}

ProfileModelStruct createProfileModelStruct({
  String? firstname,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProfileModelStruct(
      firstname: firstname,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProfileModelStruct? updateProfileModelStruct(
  ProfileModelStruct? profileModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    profileModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProfileModelStructData(
  Map<String, dynamic> firestoreData,
  ProfileModelStruct? profileModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (profileModel == null) {
    return;
  }
  if (profileModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && profileModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final profileModelData =
      getProfileModelFirestoreData(profileModel, forFieldValue);
  final nestedData =
      profileModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = profileModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProfileModelFirestoreData(
  ProfileModelStruct? profileModel, [
  bool forFieldValue = false,
]) {
  if (profileModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(profileModel.toMap());

  // Add any Firestore field values
  profileModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProfileModelListFirestoreData(
  List<ProfileModelStruct>? profileModels,
) =>
    profileModels?.map((e) => getProfileModelFirestoreData(e, true)).toList() ??
    [];
