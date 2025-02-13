import 'package:get_storage/get_storage.dart';

mixin CacheManager {

  Future<bool> saveIntroRun(bool? introRun) async {
    final storage = GetStorage();
    await storage.write(CMEnums.isIntroRun.toString(), introRun);
    return true;
  }

  bool? getIntroRun() {
    final storage = GetStorage();
    return storage.read(CMEnums.isIntroRun.toString());
  }

  Future<bool> saveSessionId(String? sessionId) async {
    final storage = GetStorage();
    await storage.write(CMEnums.sessionId.toString(), sessionId);
    return true;
  }

  String? getSessionId() {
    final storage = GetStorage();
    return storage.read(CMEnums.sessionId.toString());
  }

  Future<bool> saveRememberToken(String? token) async {
    final storage = GetStorage();
    await storage.write(CMEnums.rememberToken.toString(), token);
    return true;
  }

  String? getRememberToken() {
    final storage = GetStorage();
    return storage.read(CMEnums.rememberToken.toString());
  }


  Future<bool> saveIsAdmin(bool? isAdmin) async {
    final storage = GetStorage();
    await storage.write(CMEnums.isAdmin.toString(), isAdmin);
    return true;
  }

  bool? getIsAdmin() {
    final storage = GetStorage();
    return storage.read(CMEnums.isAdmin.toString());
  }



  Future<bool> removeAllData() async {
    final storage = GetStorage();
    await storage.remove(CMEnums.rememberToken.toString());
    await storage.remove(CMEnums.sessionId.toString());
    await storage.remove(CMEnums.isAdmin.toString());
    return true;
  }


}

enum CMEnums {
  isIntroRun ,
  rememberToken ,
  sessionId ,
  isAdmin
}

