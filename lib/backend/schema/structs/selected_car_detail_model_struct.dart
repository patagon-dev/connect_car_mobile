// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SelectedCarDetailModelStruct extends FFFirebaseStruct {
  SelectedCarDetailModelStruct({
    String? brand,
    String? model,
    String? version,
    String? image,
    String? licensePlate,
    String? year,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _brand = brand,
        _model = model,
        _version = version,
        _image = image,
        _licensePlate = licensePlate,
        _year = year,
        super(firestoreUtilData);

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  set brand(String? val) => _brand = val;
  bool hasBrand() => _brand != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  set model(String? val) => _model = val;
  bool hasModel() => _model != null;

  // "version" field.
  String? _version;
  String get version => _version ?? '';
  set version(String? val) => _version = val;
  bool hasVersion() => _version != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "licensePlate" field.
  String? _licensePlate;
  String get licensePlate => _licensePlate ?? '';
  set licensePlate(String? val) => _licensePlate = val;
  bool hasLicensePlate() => _licensePlate != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  set year(String? val) => _year = val;
  bool hasYear() => _year != null;

  static SelectedCarDetailModelStruct fromMap(Map<String, dynamic> data) =>
      SelectedCarDetailModelStruct(
        brand: data['brand'] as String?,
        model: data['model'] as String?,
        version: data['version'] as String?,
        image: data['image'] as String?,
        licensePlate: data['licensePlate'] as String?,
        year: data['year'] as String?,
      );

  static SelectedCarDetailModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SelectedCarDetailModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'brand': _brand,
        'model': _model,
        'version': _version,
        'image': _image,
        'licensePlate': _licensePlate,
        'year': _year,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'brand': serializeParam(
          _brand,
          ParamType.String,
        ),
        'model': serializeParam(
          _model,
          ParamType.String,
        ),
        'version': serializeParam(
          _version,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'licensePlate': serializeParam(
          _licensePlate,
          ParamType.String,
        ),
        'year': serializeParam(
          _year,
          ParamType.String,
        ),
      }.withoutNulls;

  static SelectedCarDetailModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SelectedCarDetailModelStruct(
        brand: deserializeParam(
          data['brand'],
          ParamType.String,
          false,
        ),
        model: deserializeParam(
          data['model'],
          ParamType.String,
          false,
        ),
        version: deserializeParam(
          data['version'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        licensePlate: deserializeParam(
          data['licensePlate'],
          ParamType.String,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SelectedCarDetailModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelectedCarDetailModelStruct &&
        brand == other.brand &&
        model == other.model &&
        version == other.version &&
        image == other.image &&
        licensePlate == other.licensePlate &&
        year == other.year;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([brand, model, version, image, licensePlate, year]);
}

SelectedCarDetailModelStruct createSelectedCarDetailModelStruct({
  String? brand,
  String? model,
  String? version,
  String? image,
  String? licensePlate,
  String? year,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelectedCarDetailModelStruct(
      brand: brand,
      model: model,
      version: version,
      image: image,
      licensePlate: licensePlate,
      year: year,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelectedCarDetailModelStruct? updateSelectedCarDetailModelStruct(
  SelectedCarDetailModelStruct? selectedCarDetailModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selectedCarDetailModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelectedCarDetailModelStructData(
  Map<String, dynamic> firestoreData,
  SelectedCarDetailModelStruct? selectedCarDetailModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selectedCarDetailModel == null) {
    return;
  }
  if (selectedCarDetailModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      selectedCarDetailModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selectedCarDetailModelData = getSelectedCarDetailModelFirestoreData(
      selectedCarDetailModel, forFieldValue);
  final nestedData =
      selectedCarDetailModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      selectedCarDetailModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelectedCarDetailModelFirestoreData(
  SelectedCarDetailModelStruct? selectedCarDetailModel, [
  bool forFieldValue = false,
]) {
  if (selectedCarDetailModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selectedCarDetailModel.toMap());

  // Add any Firestore field values
  selectedCarDetailModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelectedCarDetailModelListFirestoreData(
  List<SelectedCarDetailModelStruct>? selectedCarDetailModels,
) =>
    selectedCarDetailModels
        ?.map((e) => getSelectedCarDetailModelFirestoreData(e, true))
        .toList() ??
    [];
