import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferencesManager? _instance;
  static SharedPreferences? _sharedPreferences;

  static const String keyCookies = 'keyCookies';
  static const String isLoggedIn = 'isLoggedIn';

  static const String userId = 'userId';
  static const String nomerHP = 'nomer_hp';
  static const String otp = 'otp';
  static const String pin = 'pin';
  static const String pinInput = 'pinInput';
  static const String nomorKTP = 'nomorktp';
  static const String nama = 'nama';
  static const String tgllahir = 'tgllahir';
  static const String provinsiid = 'provinsiid';
  static const String kotaid = 'kotaid';
  static const String kecamatan = 'kecamatan';
  static const String birthPlace = 'birthPlace';
  static const String religion = 'religion';
  static const String status = 'status';
  static const String work = 'work';
  static const String gender = 'gender';
  static const String nationnality = 'nationnality';
  static const String village = 'village';
  static const String rt = 'rt';
  static const String rw = 'rw';
  static const String referral = 'referral';
  static const String alamat = 'alamat';
  static const String email = 'email';
  static const String password = 'password';
  static const String produsenId = 'produsenId';
  static const String tanggalogout = 'tanggallogout';
  static const String tanggalbanner = 'tanggalbanner';

  static const String ownerId = 'ownerId';

  static Future<SharedPreferencesManager?> getInstance() async {
    _instance ??= SharedPreferencesManager();
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  Future<bool> setBool(String key, bool value) =>
      _sharedPreferences!.setBool(key, value);

  bool? getBool(String key) => _sharedPreferences!.getBool(key);

  Future<bool> setDouble(String key, double value) =>
      _sharedPreferences!.setDouble(key, value);

  double? getDouble(String key) => _sharedPreferences!.getDouble(key);

  Future<bool> setInt(String key, int value) =>
      _sharedPreferences!.setInt(key, value);

  int? getInt(String key) => _sharedPreferences!.getInt(key);

  Future<bool> setString(String key, String value) =>
      _sharedPreferences!.setString(key, value);

  String? getString(String key) => _sharedPreferences!.getString(key);

  Future<bool> setStringList(String key, List<String> value) =>
      _sharedPreferences!.setStringList(key, value);

  List<String>? getStringList(String key) =>
      _sharedPreferences!.getStringList(key);

  bool isKeyExists(String key) => _sharedPreferences!.containsKey(key);

  Future<bool> clearKey(String key) => _sharedPreferences!.remove(key);

  Future<bool> clearAll() => _sharedPreferences!.clear();
}
