import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarAccidentRecord extends FirestoreRecord {
  CarAccidentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "palce" field.
  String? _palce;
  String get palce => _palce ?? '';
  bool hasPalce() => _palce != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "desciption" field.
  String? _desciption;
  String get desciption => _desciption ?? '';
  bool hasDesciption() => _desciption != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _palce = snapshotData['palce'] as String?;
    _status = snapshotData['status'] as String?;
    _desciption = snapshotData['desciption'] as String?;
    _img = snapshotData['img'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _date = snapshotData['date'] as String?;
    _time = snapshotData['time'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('carAccident')
          : FirebaseFirestore.instance.collectionGroup('carAccident');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('carAccident').doc(id);

  static Stream<CarAccidentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarAccidentRecord.fromSnapshot(s));

  static Future<CarAccidentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarAccidentRecord.fromSnapshot(s));

  static CarAccidentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarAccidentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarAccidentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarAccidentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarAccidentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarAccidentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarAccidentRecordData({
  String? palce,
  String? status,
  String? desciption,
  String? img,
  DateTime? createdAt,
  String? date,
  String? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'palce': palce,
      'status': status,
      'desciption': desciption,
      'img': img,
      'created_at': createdAt,
      'date': date,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarAccidentRecordDocumentEquality implements Equality<CarAccidentRecord> {
  const CarAccidentRecordDocumentEquality();

  @override
  bool equals(CarAccidentRecord? e1, CarAccidentRecord? e2) {
    return e1?.palce == e2?.palce &&
        e1?.status == e2?.status &&
        e1?.desciption == e2?.desciption &&
        e1?.img == e2?.img &&
        e1?.createdAt == e2?.createdAt &&
        e1?.date == e2?.date &&
        e1?.time == e2?.time;
  }

  @override
  int hash(CarAccidentRecord? e) => const ListEquality().hash([
        e?.palce,
        e?.status,
        e?.desciption,
        e?.img,
        e?.createdAt,
        e?.date,
        e?.time
      ]);

  @override
  bool isValidKey(Object? o) => o is CarAccidentRecord;
}
