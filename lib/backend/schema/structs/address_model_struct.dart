// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressModelStruct extends FFFirebaseStruct {
  AddressModelStruct({
    String? calle,
    String? departament,
    String? ciudad,
    String? comuna,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _calle = calle,
        _departament = departament,
        _ciudad = ciudad,
        _comuna = comuna,
        super(firestoreUtilData);

  // "Calle" field.
  String? _calle;
  String get calle => _calle ?? '';
  set calle(String? val) => _calle = val;
  bool hasCalle() => _calle != null;

  // "Departament" field.
  String? _departament;
  String get departament => _departament ?? '';
  set departament(String? val) => _departament = val;
  bool hasDepartament() => _departament != null;

  // "Ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  set ciudad(String? val) => _ciudad = val;
  bool hasCiudad() => _ciudad != null;

  // "Comuna" field.
  String? _comuna;
  String get comuna => _comuna ?? '';
  set comuna(String? val) => _comuna = val;
  bool hasComuna() => _comuna != null;

  static AddressModelStruct fromMap(Map<String, dynamic> data) =>
      AddressModelStruct(
        calle: data['Calle'] as String?,
        departament: data['Departament'] as String?,
        ciudad: data['Ciudad'] as String?,
        comuna: data['Comuna'] as String?,
      );

  static AddressModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AddressModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Calle': _calle,
        'Departament': _departament,
        'Ciudad': _ciudad,
        'Comuna': _comuna,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Calle': serializeParam(
          _calle,
          ParamType.String,
        ),
        'Departament': serializeParam(
          _departament,
          ParamType.String,
        ),
        'Ciudad': serializeParam(
          _ciudad,
          ParamType.String,
        ),
        'Comuna': serializeParam(
          _comuna,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressModelStruct(
        calle: deserializeParam(
          data['Calle'],
          ParamType.String,
          false,
        ),
        departament: deserializeParam(
          data['Departament'],
          ParamType.String,
          false,
        ),
        ciudad: deserializeParam(
          data['Ciudad'],
          ParamType.String,
          false,
        ),
        comuna: deserializeParam(
          data['Comuna'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressModelStruct &&
        calle == other.calle &&
        departament == other.departament &&
        ciudad == other.ciudad &&
        comuna == other.comuna;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([calle, departament, ciudad, comuna]);
}

AddressModelStruct createAddressModelStruct({
  String? calle,
  String? departament,
  String? ciudad,
  String? comuna,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressModelStruct(
      calle: calle,
      departament: departament,
      ciudad: ciudad,
      comuna: comuna,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressModelStruct? updateAddressModelStruct(
  AddressModelStruct? addressModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addressModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressModelStructData(
  Map<String, dynamic> firestoreData,
  AddressModelStruct? addressModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addressModel == null) {
    return;
  }
  if (addressModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addressModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressModelData =
      getAddressModelFirestoreData(addressModel, forFieldValue);
  final nestedData =
      addressModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addressModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressModelFirestoreData(
  AddressModelStruct? addressModel, [
  bool forFieldValue = false,
]) {
  if (addressModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addressModel.toMap());

  // Add any Firestore field values
  addressModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressModelListFirestoreData(
  List<AddressModelStruct>? addressModels,
) =>
    addressModels?.map((e) => getAddressModelFirestoreData(e, true)).toList() ??
    [];
