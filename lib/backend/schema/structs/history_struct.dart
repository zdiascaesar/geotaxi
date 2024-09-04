// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HistoryStruct extends FFFirebaseStruct {
  HistoryStruct({
    String? city,
    String? address,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _city = city,
        _address = address,
        super(firestoreUtilData);

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  static HistoryStruct fromMap(Map<String, dynamic> data) => HistoryStruct(
        city: data['city'] as String?,
        address: data['address'] as String?,
      );

  static HistoryStruct? maybeFromMap(dynamic data) =>
      data is Map ? HistoryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'city': _city,
        'address': _address,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
      }.withoutNulls;

  static HistoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      HistoryStruct(
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HistoryStruct &&
        city == other.city &&
        address == other.address;
  }

  @override
  int get hashCode => const ListEquality().hash([city, address]);
}

HistoryStruct createHistoryStruct({
  String? city,
  String? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HistoryStruct(
      city: city,
      address: address,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HistoryStruct? updateHistoryStruct(
  HistoryStruct? history, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    history
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHistoryStructData(
  Map<String, dynamic> firestoreData,
  HistoryStruct? history,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (history == null) {
    return;
  }
  if (history.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && history.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final historyData = getHistoryFirestoreData(history, forFieldValue);
  final nestedData = historyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = history.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHistoryFirestoreData(
  HistoryStruct? history, [
  bool forFieldValue = false,
]) {
  if (history == null) {
    return {};
  }
  final firestoreData = mapToFirestore(history.toMap());

  // Add any Firestore field values
  history.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHistoryListFirestoreData(
  List<HistoryStruct>? historys,
) =>
    historys?.map((e) => getHistoryFirestoreData(e, true)).toList() ?? [];
