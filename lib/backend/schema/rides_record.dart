import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RidesRecord extends FirestoreRecord {
  RidesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "from_location" field.
  LatLng? _fromLocation;
  LatLng? get fromLocation => _fromLocation;
  bool hasFromLocation() => _fromLocation != null;

  // "to_location" field.
  LatLng? _toLocation;
  LatLng? get toLocation => _toLocation;
  bool hasToLocation() => _toLocation != null;

  // "assigned_driver" field.
  DocumentReference? _assignedDriver;
  DocumentReference? get assignedDriver => _assignedDriver;
  bool hasAssignedDriver() => _assignedDriver != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "cost" field.
  double? _cost;
  double get cost => _cost ?? 0.0;
  bool hasCost() => _cost != null;

  // "from_loc" field.
  String? _fromLoc;
  String get fromLoc => _fromLoc ?? '';
  bool hasFromLoc() => _fromLoc != null;

  // "to_loc" field.
  String? _toLoc;
  String get toLoc => _toLoc ?? '';
  bool hasToLoc() => _toLoc != null;

  // "car_type" field.
  int? _carType;
  int get carType => _carType ?? 0;
  bool hasCarType() => _carType != null;

  // "PickedUp_at" field.
  DateTime? _pickedUpAt;
  DateTime? get pickedUpAt => _pickedUpAt;
  bool hasPickedUpAt() => _pickedUpAt != null;

  // "DroppedOff_at" field.
  DateTime? _droppedOffAt;
  DateTime? get droppedOffAt => _droppedOffAt;
  bool hasDroppedOffAt() => _droppedOffAt != null;

  // "cancelled" field.
  bool? _cancelled;
  bool get cancelled => _cancelled ?? false;
  bool hasCancelled() => _cancelled != null;

  // "finished" field.
  bool? _finished;
  bool get finished => _finished ?? false;
  bool hasFinished() => _finished != null;

  // "ready_to_pickup" field.
  bool? _readyToPickup;
  bool get readyToPickup => _readyToPickup ?? false;
  bool hasReadyToPickup() => _readyToPickup != null;

  // "latlng" field.
  LatLng? _latlng;
  LatLng? get latlng => _latlng;
  bool hasLatlng() => _latlng != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _fromLocation = snapshotData['from_location'] as LatLng?;
    _toLocation = snapshotData['to_location'] as LatLng?;
    _assignedDriver = snapshotData['assigned_driver'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _cost = castToType<double>(snapshotData['cost']);
    _fromLoc = snapshotData['from_loc'] as String?;
    _toLoc = snapshotData['to_loc'] as String?;
    _carType = castToType<int>(snapshotData['car_type']);
    _pickedUpAt = snapshotData['PickedUp_at'] as DateTime?;
    _droppedOffAt = snapshotData['DroppedOff_at'] as DateTime?;
    _cancelled = snapshotData['cancelled'] as bool?;
    _finished = snapshotData['finished'] as bool?;
    _readyToPickup = snapshotData['ready_to_pickup'] as bool?;
    _latlng = snapshotData['latlng'] as LatLng?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rides');

  static Stream<RidesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RidesRecord.fromSnapshot(s));

  static Future<RidesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RidesRecord.fromSnapshot(s));

  static RidesRecord fromSnapshot(DocumentSnapshot snapshot) => RidesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RidesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RidesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RidesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RidesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRidesRecordData({
  DocumentReference? userId,
  LatLng? fromLocation,
  LatLng? toLocation,
  DocumentReference? assignedDriver,
  int? status,
  double? cost,
  String? fromLoc,
  String? toLoc,
  int? carType,
  DateTime? pickedUpAt,
  DateTime? droppedOffAt,
  bool? cancelled,
  bool? finished,
  bool? readyToPickup,
  LatLng? latlng,
  DateTime? createdAt,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'from_location': fromLocation,
      'to_location': toLocation,
      'assigned_driver': assignedDriver,
      'status': status,
      'cost': cost,
      'from_loc': fromLoc,
      'to_loc': toLoc,
      'car_type': carType,
      'PickedUp_at': pickedUpAt,
      'DroppedOff_at': droppedOffAt,
      'cancelled': cancelled,
      'finished': finished,
      'ready_to_pickup': readyToPickup,
      'latlng': latlng,
      'created_at': createdAt,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class RidesRecordDocumentEquality implements Equality<RidesRecord> {
  const RidesRecordDocumentEquality();

  @override
  bool equals(RidesRecord? e1, RidesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.fromLocation == e2?.fromLocation &&
        e1?.toLocation == e2?.toLocation &&
        e1?.assignedDriver == e2?.assignedDriver &&
        e1?.status == e2?.status &&
        e1?.cost == e2?.cost &&
        e1?.fromLoc == e2?.fromLoc &&
        e1?.toLoc == e2?.toLoc &&
        e1?.carType == e2?.carType &&
        e1?.pickedUpAt == e2?.pickedUpAt &&
        e1?.droppedOffAt == e2?.droppedOffAt &&
        e1?.cancelled == e2?.cancelled &&
        e1?.finished == e2?.finished &&
        e1?.readyToPickup == e2?.readyToPickup &&
        e1?.latlng == e2?.latlng &&
        e1?.createdAt == e2?.createdAt &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(RidesRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.fromLocation,
        e?.toLocation,
        e?.assignedDriver,
        e?.status,
        e?.cost,
        e?.fromLoc,
        e?.toLoc,
        e?.carType,
        e?.pickedUpAt,
        e?.droppedOffAt,
        e?.cancelled,
        e?.finished,
        e?.readyToPickup,
        e?.latlng,
        e?.createdAt,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is RidesRecord;
}
