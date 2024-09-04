import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BalaceRecord extends FirestoreRecord {
  BalaceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "at" field.
  DateTime? _at;
  DateTime? get at => _at;
  bool hasAt() => _at != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = castToType<int>(snapshotData['type']);
    _amount = castToType<double>(snapshotData['amount']);
    _at = snapshotData['at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('balace')
          : FirebaseFirestore.instance.collectionGroup('balace');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('balace').doc(id);

  static Stream<BalaceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BalaceRecord.fromSnapshot(s));

  static Future<BalaceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BalaceRecord.fromSnapshot(s));

  static BalaceRecord fromSnapshot(DocumentSnapshot snapshot) => BalaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BalaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BalaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BalaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BalaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBalaceRecordData({
  int? type,
  double? amount,
  DateTime? at,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'amount': amount,
      'at': at,
    }.withoutNulls,
  );

  return firestoreData;
}

class BalaceRecordDocumentEquality implements Equality<BalaceRecord> {
  const BalaceRecordDocumentEquality();

  @override
  bool equals(BalaceRecord? e1, BalaceRecord? e2) {
    return e1?.type == e2?.type && e1?.amount == e2?.amount && e1?.at == e2?.at;
  }

  @override
  int hash(BalaceRecord? e) =>
      const ListEquality().hash([e?.type, e?.amount, e?.at]);

  @override
  bool isValidKey(Object? o) => o is BalaceRecord;
}
