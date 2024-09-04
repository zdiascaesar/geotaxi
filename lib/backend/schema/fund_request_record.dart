import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FundRequestRecord extends FirestoreRecord {
  FundRequestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sum" field.
  double? _sum;
  double get sum => _sum ?? 0.0;
  bool hasSum() => _sum != null;

  // "network" field.
  String? _network;
  String get network => _network ?? '';
  bool hasNetwork() => _network != null;

  // "wallet" field.
  String? _wallet;
  String get wallet => _wallet ?? '';
  bool hasWallet() => _wallet != null;

  // "isDone" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  bool hasIsDone() => _isDone != null;

  // "last_update" field.
  DateTime? _lastUpdate;
  DateTime? get lastUpdate => _lastUpdate;
  bool hasLastUpdate() => _lastUpdate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _sum = castToType<double>(snapshotData['sum']);
    _network = snapshotData['network'] as String?;
    _wallet = snapshotData['wallet'] as String?;
    _isDone = snapshotData['isDone'] as bool?;
    _lastUpdate = snapshotData['last_update'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('fundRequest')
          : FirebaseFirestore.instance.collectionGroup('fundRequest');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('fundRequest').doc(id);

  static Stream<FundRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FundRequestRecord.fromSnapshot(s));

  static Future<FundRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FundRequestRecord.fromSnapshot(s));

  static FundRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FundRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FundRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FundRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FundRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FundRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFundRequestRecordData({
  double? sum,
  String? network,
  String? wallet,
  bool? isDone,
  DateTime? lastUpdate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sum': sum,
      'network': network,
      'wallet': wallet,
      'isDone': isDone,
      'last_update': lastUpdate,
    }.withoutNulls,
  );

  return firestoreData;
}

class FundRequestRecordDocumentEquality implements Equality<FundRequestRecord> {
  const FundRequestRecordDocumentEquality();

  @override
  bool equals(FundRequestRecord? e1, FundRequestRecord? e2) {
    return e1?.sum == e2?.sum &&
        e1?.network == e2?.network &&
        e1?.wallet == e2?.wallet &&
        e1?.isDone == e2?.isDone &&
        e1?.lastUpdate == e2?.lastUpdate;
  }

  @override
  int hash(FundRequestRecord? e) => const ListEquality()
      .hash([e?.sum, e?.network, e?.wallet, e?.isDone, e?.lastUpdate]);

  @override
  bool isValidKey(Object? o) => o is FundRequestRecord;
}
