import 'package:shared_preferences/shared_preferences.dart';

class CacheStorage {
  static const _userIdKey = 'userId';
  static const _tokenKey = 'token';
  static const _allowedKeys = {_userIdKey, _tokenKey};

  final SharedPreferencesWithCache _prefs;

  CacheStorage._(this._prefs);

  static CacheStorage? _instance;

  static Future<CacheStorage> getInstance() async {
    if (_instance == null) {
      final prefs = await SharedPreferencesWithCache.create(
          cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: _allowedKeys,
      ));
      _instance = CacheStorage._(prefs);
    }
    return _instance!;
  }

  Future<void> saveAuthData({
    required String userId,
    required String token,
  }) async {
    await Future.wait([
      _prefs.setString(_userIdKey, userId),
      _prefs.setString(_tokenKey, token),
    ]);
  }

  Future<String?> getString(String key) async {
    if (!_allowedKeys.contains(key)) {
      throw Exception('Key $key is not allowed in CacheStorage');
    }
    return _prefs.getString(key);
  }

  Future<void> clearAuthData() async {
    await _prefs.clear();
  }
}
