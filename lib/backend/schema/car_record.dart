import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarRecord extends FirestoreRecord {
  CarRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "plate" field.
  String? _plate;
  String get plate => _plate ?? '';
  bool hasPlate() => _plate != null;

  // "license" field.
  String? _license;
  String get license => _license ?? '';
  bool hasLicense() => _license != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _brand = snapshotData['brand'] as String?;
    _model = snapshotData['model'] as String?;
    _plate = snapshotData['plate'] as String?;
    _license = snapshotData['license'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('car')
          : FirebaseFirestore.instance.collectionGroup('car');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('car').doc(id);

  static Stream<CarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarRecord.fromSnapshot(s));

  static Future<CarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarRecord.fromSnapshot(s));

  static CarRecord fromSnapshot(DocumentSnapshot snapshot) => CarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarRecordData({
  String? brand,
  String? model,
  String? plate,
  String? license,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'brand': brand,
      'model': model,
      'plate': plate,
      'license': license,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarRecordDocumentEquality implements Equality<CarRecord> {
  const CarRecordDocumentEquality();

  @override
  bool equals(CarRecord? e1, CarRecord? e2) {
    return e1?.brand == e2?.brand &&
        e1?.model == e2?.model &&
        e1?.plate == e2?.plate &&
        e1?.license == e2?.license;
  }

  @override
  int hash(CarRecord? e) =>
      const ListEquality().hash([e?.brand, e?.model, e?.plate, e?.license]);

  @override
  bool isValidKey(Object? o) => o is CarRecord;
}
