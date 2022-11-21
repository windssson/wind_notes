import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wind_notes/AuthPages/controller.dart';
import 'package:wind_notes/AuthPages/giris_yap.dart';
import 'package:wind_notes/anasayfa.dart';
import 'package:wind_notes/onboard/onboard.dart';

void main() async {
  final bool auth;
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await Supabase.initialize(
      url: 'https://pgyxxacjrpmcaqzkqaas.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBneXh4YWNqcnBtY2FxemtxYWFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg3Mjk0NTIsImV4cCI6MTk4NDMwNTQ1Mn0.iqvJ3N49PsX0ynvekBD0FvPrftc20qnhVvGwWEwIYkE');
  auth = await UserController().loginControl();
  final bool first = prefs.getBool('firstapp') ?? true;
  runApp(MyApp(
    auth: auth,
    fisrt: first,
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key, required this.auth, required this.fisrt});
  bool auth;
  bool fisrt;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Wind Notes',
        debugShowCheckedModeBanner: false,
        home: auth ? const Anasayfa() : (fisrt ? OnBoard() : const GirisYapPage()));
  }
}
