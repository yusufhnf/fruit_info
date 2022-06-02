import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class PrefHelper {
  static final PrefHelper to = PrefHelper._singleTon();

  factory PrefHelper() {
    return to;
  }
  PrefHelper._singleTon();
  static final _storage = GetStorage();

  void saveToken({required String token}) {
    _storage.write("token", token);
  }

  String? getToken() {
    if (_storage.read("token") != null) return _storage.read("token");
    return null;
  }

  void removeAuth() {
    _storage.remove("fcm_token");
    _storage.remove("profile");
    _storage.remove("token");
  }

  void saveFcmToken({required String token}) {
    _storage.write("fcm_token", token);
  }

  String? getFcmToken() {
    if (_storage.read("fcm_token") != null) return _storage.read("fcm_token");
    return null;
  }
}
