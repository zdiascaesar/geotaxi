import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarTypesRecord extends FirestoreRecord {
  CarTypesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "car_model" field.
  String? _carModel;
  String get carModel => _carModel ?? '';
  bool hasCarModel() => _carModel != null;

  // "car_version" field.
  String? _carVersion;
  String get carVersion => _carVersion ?? '';
  bool hasCarVersion() => _carVersion != null;

  // "car_year" field.
  int? _carYear;
  int get carYear => _carYear ?? 0;
  bool hasCarYear() => _carYear != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _carModel = snapshotData['car_model'] as String?;
    _carVersion = snapshotData['car_version'] as String?;
    _carYear = castToType<int>(snapshotData['car_year']);
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('car_types');

  static Stream<CarTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarTypesRecord.fromSnapshot(s));

  static Future<CarTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarTypesRecord.fromSnapshot(s));

  static CarTypesRecord fromSnapshot(DocumentSnapshot snapshot) => CarTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarTypesRecordData({
  String? carModel,
  String? carVersion,
  int? carYear,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'car_model': carModel,
      'car_version': carVersion,
      'car_year': carYear,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarTypesRecordDocumentEquality implements Equality<CarTypesRecord> {
  const CarTypesRecordDocumentEquality();

  @override
  bool equals(CarTypesRecord? e1, CarTypesRecord? e2) {
    return e1?.carModel == e2?.carModel &&
        e1?.carVersion == e2?.carVersion &&
        e1?.carYear == e2?.carYear &&
        e1?.category == e2?.category;
  }

  @override
  int hash(CarTypesRecord? e) => const ListEquality()
      .hash([e?.carModel, e?.carVersion, e?.carYear, e?.category]);

  @override
  bool isValidKey(Object? o) => o is CarTypesRecord;
}
