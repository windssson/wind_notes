import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends GetxController {

  Future<bool> loginController() async {
    await Future.delayed(const Duration(seconds:4));
    log('Döngü tamam');
    return true;
  }

  void googleSignin() async {
    final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleuser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    log('message');
    log(FirebaseAuth.instance.currentUser.toString());
    final supabaseclient = Supabase.instance.client;
    final data = await supabaseclient.from('Users').insert({
      'user_name': FirebaseAuth.instance.currentUser!.displayName,
      'user_mail': FirebaseAuth.instance.currentUser!.email
    });
    log(data.toString());
  }
}
