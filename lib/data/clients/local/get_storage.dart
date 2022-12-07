import 'package:asman_work/utils/globals/enums.dart';
import 'package:get_storage/get_storage.dart';

class StorageGet {
  final _getStorage = GetStorage();

  void reset() {
    _getStorage.erase();
  }

  T? getValue<T>(EnumStorageKeys key) {
    return _getStorage.read<T>(key.name);
  }

  void saveValue(EnumStorageKeys key, dynamic value) {
    if (value.runtimeType != String && value.toString().isNotEmpty ||
        value.toString() != ' ') {
      _getStorage.write(key.name, value);
    }
  }

  void delValue(EnumStorageKeys key) {
    _getStorage.remove(key.name);
  }

  List<dynamic> getListValues(EnumStorageKeys key) {
    _getStorage.writeIfNull(key.name, <dynamic>[]);
    final list = _getStorage.read<List<dynamic>>(key.name) ?? <dynamic>[];
    final data = <dynamic>[];
    for (final el in list) {
      data.add(el);
    }
    return data;
  }

  void addToList(EnumStorageKeys key, String value) {
    if (value.isEmpty || value == ' ' || value == '-') return;
    _getStorage.writeIfNull(key.name, <dynamic>[]);
    final cur = getListValues(key);
    if (!cur.contains(value)) {
      cur.add(value.trim());
      saveValue(key, cur);
    }
  }

  void delFromList(EnumStorageKeys key, String valueToBeDel) {
    final current = getListValues(key);
    if (current.contains(valueToBeDel)) {
      current.remove(valueToBeDel);
      saveValue(key, current);
    }
  }
}
