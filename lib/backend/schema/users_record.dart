import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "role" field.
  int? _role;
  int get role => _role ?? 0;
  bool hasRole() => _role != null;

  // "secondname" field.
  String? _secondname;
  String get secondname => _secondname ?? '';
  bool hasSecondname() => _secondname != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  bool hasBalance() => _balance != null;

  // "ready_for_work" field.
  bool? _readyForWork;
  bool get readyForWork => _readyForWork ?? false;
  bool hasReadyForWork() => _readyForWork != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "driver_type" field.
  int? _driverType;
  int get driverType => _driverType ?? 0;
  bool hasDriverType() => _driverType != null;

  // "full_registration_completed" field.
  bool? _fullRegistrationCompleted;
  bool get fullRegistrationCompleted => _fullRegistrationCompleted ?? false;
  bool hasFullRegistrationCompleted() => _fullRegistrationCompleted != null;

  // "driver_location" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  // "inprogress" field.
  bool? _inprogress;
  bool get inprogress => _inprogress ?? false;
  bool hasInprogress() => _inprogress != null;

  // "amount_of_rates" field.
  int? _amountOfRates;
  int get amountOfRates => _amountOfRates ?? 0;
  bool hasAmountOfRates() => _amountOfRates != null;

  // "total_rate" field.
  double? _totalRate;
  double get totalRate => _totalRate ?? 0.0;
  bool hasTotalRate() => _totalRate != null;

  // "dismissed_rides" field.
  List<DocumentReference>? _dismissedRides;
  List<DocumentReference> get dismissedRides => _dismissedRides ?? const [];
  bool hasDismissedRides() => _dismissedRides != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _role = castToType<int>(snapshotData['role']);
    _secondname = snapshotData['secondname'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _location = snapshotData['location'] as LatLng?;
    _balance = castToType<double>(snapshotData['balance']);
    _readyForWork = snapshotData['ready_for_work'] as bool?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _driverType = castToType<int>(snapshotData['driver_type']);
    _fullRegistrationCompleted =
        snapshotData['full_registration_completed'] as bool?;
    _driverLocation = snapshotData['driver_location'] as LatLng?;
    _inprogress = snapshotData['inprogress'] as bool?;
    _amountOfRates = castToType<int>(snapshotData['amount_of_rates']);
    _totalRate = castToType<double>(snapshotData['total_rate']);
    _dismissedRides = getDataList(snapshotData['dismissed_rides']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? role,
  String? secondname,
  double? rating,
  LatLng? location,
  double? balance,
  bool? readyForWork,
  bool? isDeleted,
  int? driverType,
  bool? fullRegistrationCompleted,
  LatLng? driverLocation,
  bool? inprogress,
  int? amountOfRates,
  double? totalRate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'role': role,
      'secondname': secondname,
      'rating': rating,
      'location': location,
      'balance': balance,
      'ready_for_work': readyForWork,
      'is_deleted': isDeleted,
      'driver_type': driverType,
      'full_registration_completed': fullRegistrationCompleted,
      'driver_location': driverLocation,
      'inprogress': inprogress,
      'amount_of_rates': amountOfRates,
      'total_rate': totalRate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.role == e2?.role &&
        e1?.secondname == e2?.secondname &&
        e1?.rating == e2?.rating &&
        e1?.location == e2?.location &&
        e1?.balance == e2?.balance &&
        e1?.readyForWork == e2?.readyForWork &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.driverType == e2?.driverType &&
        e1?.fullRegistrationCompleted == e2?.fullRegistrationCompleted &&
        e1?.driverLocation == e2?.driverLocation &&
        e1?.inprogress == e2?.inprogress &&
        e1?.amountOfRates == e2?.amountOfRates &&
        e1?.totalRate == e2?.totalRate &&
        listEquality.equals(e1?.dismissedRides, e2?.dismissedRides);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.role,
        e?.secondname,
        e?.rating,
        e?.location,
        e?.balance,
        e?.readyForWork,
        e?.isDeleted,
        e?.driverType,
        e?.fullRegistrationCompleted,
        e?.driverLocation,
        e?.inprogress,
        e?.amountOfRates,
        e?.totalRate,
        e?.dismissedRides
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
