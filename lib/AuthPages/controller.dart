import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends GetxController {
  final db = Supabase.instance.client;
  RxString user = ''.obs;

  Future<bool> loginControl() async {
    var prefs = await SharedPreferences.getInstance();
    final String login =  prefs.getString('usermail') ?? '';
    if (login.isEmpty) {
      return false;
    } else {
      user.value = login;
      return true;
    }
  }

  Future<bool> logout() async {
    var prefs = await SharedPreferences.getInstance();
    var logout = await prefs.remove('usermail');
    if (logout) {
      log('Logout başarılı');
      return true;
    } else {
      log('Çıkış yapılamadı');
      return false;
    }
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
      var prefs = await SharedPreferences.getInstance();
      await prefs.setBool('firstapp', false);
      return true;
    }
  }

  Future<bool> userLogin(String email, String sifre) async {
    var data = await db
        .from('Users')
        .select('*')
        .eq('usermail', email)
        .eq('password', sifre);

    if (data.isEmpty) {
      return false;
    } else {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setBool('firstapp', false);
      await prefs.setString('usermail', email);
      return true;
    }
  }
}
