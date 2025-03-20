import 'package:flutter_my_blueprint/core/data/service/shared_preference/app_shared_prefernce_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preference_service.g.dart';

@Riverpod(keepAlive: true)
SharedPreferenceService sharedPreferenceService(Ref ref) {
  return SharedPreferenceService();
}

class SharedPreferenceService {
  SharedPreferenceService();

  final SharedPreferencesAsync _asyncPrefs = SharedPreferencesAsync();

  Future<void> save<T>(AppSharedPreferenceKey<T> key, T value) async {
    try {
      switch (value) {
        case String _:
          await _asyncPrefs.setString(key.keyName, value);
        case int _:
          await _asyncPrefs.setInt(key.keyName, value);
        case List<String> _:
          await _asyncPrefs.setStringList(key.keyName, value);
        case double _:
          await _asyncPrefs.setDouble(key.keyName, value);
        case bool _:
          await _asyncPrefs.setBool(key.keyName, value);
      }
    } on Exception {
      return;
    }
  }

  Future<T?> read<T>(AppSharedPreferenceKey<T> key) async {
    final type = T;
    try {
      switch (type) {
        case const (String):
          return _asyncPrefs.getString(key.keyName) as Future<T?>;
        case const (bool):
          return _asyncPrefs.getBool(key.keyName) as Future<T?>;
        case const (List<String>):
          return _asyncPrefs.getStringList(key.keyName) as Future<T?>;
        case const (int):
          return _asyncPrefs.getInt(key.keyName) as Future<T?>;
        case const (double):
          return _asyncPrefs.getDouble(key.keyName) as Future<T?>;
      }
    } on Exception {
      return null;
    }
    return null;
  }
}
