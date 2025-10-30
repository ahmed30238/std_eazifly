import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:get_storage/get_storage.dart';

class TokenUtil {
  static String _token = '';

  static Future<void> loadTokenToMemory() async {
    var getStorage = GetStorage();
    _token = !getStorage.hasData(TokenEnum.token.name)
        ? ''
        : getStorage.read(TokenEnum.token.name);
  }

  static String getTokenFromMemory() {
    return _token;
  }

  static Future<void> saveToken(String myToken) async {
    GetStorage().write(TokenEnum.token.name, myToken);
    await loadTokenToMemory();
  }

  static Future<void> clearToken() async {
    await GetStorage().remove(StorageEnum.loginModel.name);
    await GetStorage().remove(TokenEnum.token.name);
    await GetStorage().remove(StorageEnum.fcmToken.name);

    _token = "";
  }
}

enum TokenEnum { token }
