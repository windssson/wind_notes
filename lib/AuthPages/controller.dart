import 'dart:developer';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends GetxController {
  final db = Supabase.instance.client;
  Future<bool> loginControl() async {
    return false;
  }

  Future<bool> usernameControl(String email) async {
    var emailcontrol = await db.from('Users').select('*').eq('usermail', email);
    log(emailcontrol.toString());
    if (emailcontrol.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createUser(String email, String sifre) async {
    var data = await db
        .from('Users')
        .insert({'usermail': email, 'password': sifre}).select();

    if (data.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
