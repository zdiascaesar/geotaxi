import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupportChatRecord extends FirestoreRecord {
  SupportChatRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "message_by" field.
  DocumentReference? _messageBy;
  DocumentReference? get messageBy => _messageBy;
  bool hasMessageBy() => _messageBy != null;

  // "message_at" field.
  DateTime? _messageAt;
  DateTime? get messageAt => _messageAt;
  bool hasMessageAt() => _messageAt != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _messageBy = snapshotData['message_by'] as DocumentReference?;
    _messageAt = snapshotData['message_at'] as DateTime?;
    _message = snapshotData['message'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('supportChat')
          : FirebaseFirestore.instance.collectionGroup('supportChat');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('supportChat').doc(id);

  static Stream<SupportChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupportChatRecord.fromSnapshot(s));

  static Future<SupportChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupportChatRecord.fromSnapshot(s));

  static SupportChatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupportChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupportChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupportChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupportChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupportChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupportChatRecordData({
  DocumentReference? messageBy,
  DateTime? messageAt,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message_by': messageBy,
      'message_at': messageAt,
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupportChatRecordDocumentEquality implements Equality<SupportChatRecord> {
  const SupportChatRecordDocumentEquality();

  @override
  bool equals(SupportChatRecord? e1, SupportChatRecord? e2) {
    return e1?.messageBy == e2?.messageBy &&
        e1?.messageAt == e2?.messageAt &&
        e1?.message == e2?.message;
  }

  @override
  int hash(SupportChatRecord? e) =>
      const ListEquality().hash([e?.messageBy, e?.messageAt, e?.message]);

  @override
  bool isValidKey(Object? o) => o is SupportChatRecord;
}
