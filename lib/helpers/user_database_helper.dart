import 'dart:convert';

import 'package:kmp_togo_mobile/models/account/login_info.dart';
import 'package:kmp_togo_mobile/providers/database/database.dart';

class UserHelper {
  static Future<DataUser> getUser() async {
    final db = await databaseApp.getResponse();
    return LoginInfo.fromJson(jsonDecode(
            db.firstWhere((element) => element.path == 'login').responseBody))
        .data;
  }
}
