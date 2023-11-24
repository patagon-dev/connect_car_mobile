import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuscripcionesServicesRecord extends FirestoreRecord {
  SuscripcionesServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "agendar_mantencion" field.
  bool? _agendarMantencion;
  bool get agendarMantencion => _agendarMantencion ?? false;
  bool hasAgendarMantencion() => _agendarMantencion != null;

  // "asistencia_en_ruta" field.
  bool? _asistenciaEnRuta;
  bool get asistenciaEnRuta => _asistenciaEnRuta ?? false;
  bool hasAsistenciaEnRuta() => _asistenciaEnRuta != null;

  // "lavado_de_auto" field.
  bool? _lavadoDeAuto;
  bool get lavadoDeAuto => _lavadoDeAuto ?? false;
  bool hasLavadoDeAuto() => _lavadoDeAuto != null;

  // "arriendo_accesorios" field.
  bool? _arriendoAccesorios;
  bool get arriendoAccesorios => _arriendoAccesorios ?? false;
  bool hasArriendoAccesorios() => _arriendoAccesorios != null;

  // "gestion_de_multas" field.
  bool? _gestionDeMultas;
  bool get gestionDeMultas => _gestionDeMultas ?? false;
  bool hasGestionDeMultas() => _gestionDeMultas != null;

  // "viajeal_extranjero" field.
  bool? _viajealExtranjero;
  bool get viajealExtranjero => _viajealExtranjero ?? false;
  bool hasViajealExtranjero() => _viajealExtranjero != null;

  // "emergencias" field.
  bool? _emergencias;
  bool get emergencias => _emergencias ?? false;
  bool hasEmergencias() => _emergencias != null;

  void _initializeFields() {
    _agendarMantencion = snapshotData['agendar_mantencion'] as bool?;
    _asistenciaEnRuta = snapshotData['asistencia_en_ruta'] as bool?;
    _lavadoDeAuto = snapshotData['lavado_de_auto'] as bool?;
    _arriendoAccesorios = snapshotData['arriendo_accesorios'] as bool?;
    _gestionDeMultas = snapshotData['gestion_de_multas'] as bool?;
    _viajealExtranjero = snapshotData['viajeal_extranjero'] as bool?;
    _emergencias = snapshotData['emergencias'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('suscripciones_services');

  static Stream<SuscripcionesServicesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SuscripcionesServicesRecord.fromSnapshot(s));

  static Future<SuscripcionesServicesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SuscripcionesServicesRecord.fromSnapshot(s));

  static SuscripcionesServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuscripcionesServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuscripcionesServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuscripcionesServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuscripcionesServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuscripcionesServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuscripcionesServicesRecordData({
  bool? agendarMantencion,
  bool? asistenciaEnRuta,
  bool? lavadoDeAuto,
  bool? arriendoAccesorios,
  bool? gestionDeMultas,
  bool? viajealExtranjero,
  bool? emergencias,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'agendar_mantencion': agendarMantencion,
      'asistencia_en_ruta': asistenciaEnRuta,
      'lavado_de_auto': lavadoDeAuto,
      'arriendo_accesorios': arriendoAccesorios,
      'gestion_de_multas': gestionDeMultas,
      'viajeal_extranjero': viajealExtranjero,
      'emergencias': emergencias,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuscripcionesServicesRecordDocumentEquality
    implements Equality<SuscripcionesServicesRecord> {
  const SuscripcionesServicesRecordDocumentEquality();

  @override
  bool equals(
      SuscripcionesServicesRecord? e1, SuscripcionesServicesRecord? e2) {
    return e1?.agendarMantencion == e2?.agendarMantencion &&
        e1?.asistenciaEnRuta == e2?.asistenciaEnRuta &&
        e1?.lavadoDeAuto == e2?.lavadoDeAuto &&
        e1?.arriendoAccesorios == e2?.arriendoAccesorios &&
        e1?.gestionDeMultas == e2?.gestionDeMultas &&
        e1?.viajealExtranjero == e2?.viajealExtranjero &&
        e1?.emergencias == e2?.emergencias;
  }

  @override
  int hash(SuscripcionesServicesRecord? e) => const ListEquality().hash([
        e?.agendarMantencion,
        e?.asistenciaEnRuta,
        e?.lavadoDeAuto,
        e?.arriendoAccesorios,
        e?.gestionDeMultas,
        e?.viajealExtranjero,
        e?.emergencias
      ]);

  @override
  bool isValidKey(Object? o) => o is SuscripcionesServicesRecord;
}
