import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _categories = (await secureStorage.getStringList('ff_categories'))
              ?.map((x) {
                try {
                  return CategoriesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _categories;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _userGreetingMessage = '';
  String get userGreetingMessage => _userGreetingMessage;
  set userGreetingMessage(String value) {
    _userGreetingMessage = value;
  }

  List<CategoriesStruct> _categories = [];
  List<CategoriesStruct> get categories => _categories;
  set categories(List<CategoriesStruct> value) {
    _categories = value;
    secureStorage.setStringList(
        'ff_categories', value.map((x) => x.serialize()).toList());
  }

  void deleteCategories() {
    secureStorage.delete(key: 'ff_categories');
  }

  void addToCategories(CategoriesStruct value) {
    categories.add(value);
    secureStorage.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void removeFromCategories(CategoriesStruct value) {
    categories.remove(value);
    secureStorage.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCategories(int index) {
    categories.removeAt(index);
    secureStorage.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void updateCategoriesAtIndex(
    int index,
    CategoriesStruct Function(CategoriesStruct) updateFn,
  ) {
    categories[index] = updateFn(_categories[index]);
    secureStorage.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCategories(int index, CategoriesStruct value) {
    categories.insert(index, value);
    secureStorage.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
