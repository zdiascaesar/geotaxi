import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RideCancelsRecord extends FirestoreRecord {
  RideCancelsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ride_id" field.
  String? _rideId;
  String get rideId => _rideId ?? '';
  bool hasRideId() => _rideId != null;

  // "driver" field.
  DocumentReference? _driver;
  DocumentReference? get driver => _driver;
  bool hasDriver() => _driver != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "problem" field.
  String? _problem;
  String get problem => _problem ?? '';
  bool hasProblem() => _problem != null;

  void _initializeFields() {
    _rideId = snapshotData['ride_id'] as String?;
    _driver = snapshotData['driver'] as DocumentReference?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _problem = snapshotData['problem'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rideCancels');

  static Stream<RideCancelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RideCancelsRecord.fromSnapshot(s));

  static Future<RideCancelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RideCancelsRecord.fromSnapshot(s));

  static RideCancelsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RideCancelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RideCancelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RideCancelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RideCancelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RideCancelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRideCancelsRecordData({
  String? rideId,
  DocumentReference? driver,
  DocumentReference? createdBy,
  DateTime? createdAt,
  String? problem,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ride_id': rideId,
      'driver': driver,
      'created_by': createdBy,
      'created_at': createdAt,
      'problem': problem,
    }.withoutNulls,
  );

  return firestoreData;
}

class RideCancelsRecordDocumentEquality implements Equality<RideCancelsRecord> {
  const RideCancelsRecordDocumentEquality();

  @override
  bool equals(RideCancelsRecord? e1, RideCancelsRecord? e2) {
    return e1?.rideId == e2?.rideId &&
        e1?.driver == e2?.driver &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.problem == e2?.problem;
  }

  @override
  int hash(RideCancelsRecord? e) => const ListEquality()
      .hash([e?.rideId, e?.driver, e?.createdBy, e?.createdAt, e?.problem]);

  @override
  bool isValidKey(Object? o) => o is RideCancelsRecord;
}
