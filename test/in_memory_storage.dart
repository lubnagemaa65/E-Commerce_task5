import 'package:get_storage/get_storage.dart';

abstract class InMemoryStorage implements GetStorage {
  final Map<String, dynamic> _storage = {};

  @override
  T? read<T>(String key) {
    return _storage[key] as T?; // Return the value as type T
  }

  @override
  Future<void> write(String key, dynamic value) async {
    _storage[key] = value;
  }

  @override
  Future<void> erase() async {
    _storage.clear();
  }

  @override
  Future<void> remove(String key) async {
    _storage.remove(key);
  }
}
