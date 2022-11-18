import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wind_notes/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://pgyxxacjrpmcaqzkqaas.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBneXh4YWNqcnBtY2FxemtxYWFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg3Mjk0NTIsImV4cCI6MTk4NDMwNTQ1Mn0.iqvJ3N49PsX0ynvekBD0FvPrftc20qnhVvGwWEwIYkE',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wind Notes',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
