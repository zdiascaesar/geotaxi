import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _review = snapshotData['review'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reviews')
          : FirebaseFirestore.instance.collectionGroup('reviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('reviews').doc(id);

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  String? review,
  double? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'review': review,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.review == e2?.review && e1?.rating == e2?.rating;
  }

  @override
  int hash(ReviewsRecord? e) =>
      const ListEquality().hash([e?.review, e?.rating]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
