import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestsRecord extends FirestoreRecord {
  RequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "request" field.
  String? _request;
  String get request => _request ?? '';
  bool hasRequest() => _request != null;

  // "requested_at" field.
  DateTime? _requestedAt;
  DateTime? get requestedAt => _requestedAt;
  bool hasRequestedAt() => _requestedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _request = snapshotData['request'] as String?;
    _requestedAt = snapshotData['requested_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('requests')
          : FirebaseFirestore.instance.collectionGroup('requests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('requests').doc(id);

  static Stream<RequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsRecord.fromSnapshot(s));

  static Future<RequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsRecord.fromSnapshot(s));

  static RequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsRecordData({
  String? request,
  DateTime? requestedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'request': request,
      'requested_at': requestedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsRecordDocumentEquality implements Equality<RequestsRecord> {
  const RequestsRecordDocumentEquality();

  @override
  bool equals(RequestsRecord? e1, RequestsRecord? e2) {
    return e1?.request == e2?.request && e1?.requestedAt == e2?.requestedAt;
  }

  @override
  int hash(RequestsRecord? e) =>
      const ListEquality().hash([e?.request, e?.requestedAt]);

  @override
  bool isValidKey(Object? o) => o is RequestsRecord;
}
