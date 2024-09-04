import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "messaged_at" field.
  DateTime? _messagedAt;
  DateTime? get messagedAt => _messagedAt;
  bool hasMessagedAt() => _messagedAt != null;

  // "message_by" field.
  DocumentReference? _messageBy;
  DocumentReference? get messageBy => _messageBy;
  bool hasMessageBy() => _messageBy != null;

  // "isRead" field.
  List<DocumentReference>? _isRead;
  List<DocumentReference> get isRead => _isRead ?? const [];
  bool hasIsRead() => _isRead != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _messagedAt = snapshotData['messaged_at'] as DateTime?;
    _messageBy = snapshotData['message_by'] as DocumentReference?;
    _isRead = getDataList(snapshotData['isRead']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat')
          : FirebaseFirestore.instance.collectionGroup('chat');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chat').doc(id);

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  String? message,
  DateTime? messagedAt,
  DocumentReference? messageBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'messaged_at': messagedAt,
      'message_by': messageBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.message == e2?.message &&
        e1?.messagedAt == e2?.messagedAt &&
        e1?.messageBy == e2?.messageBy &&
        listEquality.equals(e1?.isRead, e2?.isRead);
  }

  @override
  int hash(ChatRecord? e) => const ListEquality()
      .hash([e?.message, e?.messagedAt, e?.messageBy, e?.isRead]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
