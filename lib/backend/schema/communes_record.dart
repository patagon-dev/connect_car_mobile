import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CommunesRecord extends FirestoreRecord {
  CommunesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _id = snapshotData['id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('communes');

  static Stream<CommunesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunesRecord.fromSnapshot(s));

  static Future<CommunesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunesRecord.fromSnapshot(s));

  static CommunesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunesRecordData({
  String? name,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunesRecordDocumentEquality implements Equality<CommunesRecord> {
  const CommunesRecordDocumentEquality();

  @override
  bool equals(CommunesRecord? e1, CommunesRecord? e2) {
    return e1?.name == e2?.name && e1?.id == e2?.id;
  }

  @override
  int hash(CommunesRecord? e) => const ListEquality().hash([e?.name, e?.id]);

  @override
  bool isValidKey(Object? o) => o is CommunesRecord;
}
