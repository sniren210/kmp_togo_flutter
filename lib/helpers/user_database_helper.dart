import 'dart:convert';

import 'package:get/get.dart';
import 'package:kmp_togo_mobile/models/account/login_info.dart';
import 'package:kmp_togo_mobile/providers/database/database.dart';

class UserHelper {
  static Future<DataUser?> getUser() async {
    final db = await databaseApp.getResponse();

    final user = db.firstWhereOrNull((element) => element.path == 'login');

    if (user == null) return null;

    return LoginInfo.fromJson(jsonDecode(user.responseBody)).data;
  }
}
