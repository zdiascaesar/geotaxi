import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _role = prefs.getInt('ff_role') ?? _role;
    });
    _safeInit(() {
      _history = prefs
              .getStringList('ff_history')
              ?.map((x) {
                try {
                  return HistoryStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _history;
    });
    _safeInit(() {
      _initialMap =
          latLngFromString(prefs.getString('ff_initialMap')) ?? _initialMap;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _fromWhere;
  LatLng? get fromWhere => _fromWhere;
  set fromWhere(LatLng? value) {
    _fromWhere = value;
  }

  LatLng? _toWhere;
  LatLng? get toWhere => _toWhere;
  set toWhere(LatLng? value) {
    _toWhere = value;
  }

  int _role = 0;
  int get role => _role;
  set role(int value) {
    _role = value;
    prefs.setInt('ff_role', value);
  }

  String _addressFromMap = '';
  String get addressFromMap => _addressFromMap;
  set addressFromMap(String value) {
    _addressFromMap = value;
  }

  String _addressToMap = '';
  String get addressToMap => _addressToMap;
  set addressToMap(String value) {
    _addressToMap = value;
  }

  List<HistoryStruct> _history = [];
  List<HistoryStruct> get history => _history;
  set history(List<HistoryStruct> value) {
    _history = value;
    prefs.setStringList('ff_history', value.map((x) => x.serialize()).toList());
  }

  void addToHistory(HistoryStruct value) {
    history.add(value);
    prefs.setStringList(
        'ff_history', _history.map((x) => x.serialize()).toList());
  }

  void removeFromHistory(HistoryStruct value) {
    history.remove(value);
    prefs.setStringList(
        'ff_history', _history.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromHistory(int index) {
    history.removeAt(index);
    prefs.setStringList(
        'ff_history', _history.map((x) => x.serialize()).toList());
  }

  void updateHistoryAtIndex(
    int index,
    HistoryStruct Function(HistoryStruct) updateFn,
  ) {
    history[index] = updateFn(_history[index]);
    prefs.setStringList(
        'ff_history', _history.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInHistory(int index, HistoryStruct value) {
    history.insert(index, value);
    prefs.setStringList(
        'ff_history', _history.map((x) => x.serialize()).toList());
  }

  LatLng? _initialMap = const LatLng(55.755826, 37.6173);
  LatLng? get initialMap => _initialMap;
  set initialMap(LatLng? value) {
    _initialMap = value;
    value != null
        ? prefs.setString('ff_initialMap', value.serialize())
        : prefs.remove('ff_initialMap');
  }

  LatLng? _currentDeviceLocation = const LatLng(55.755826, 37.6173);
  LatLng? get currentDeviceLocation => _currentDeviceLocation;
  set currentDeviceLocation(LatLng? value) {
    _currentDeviceLocation = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
