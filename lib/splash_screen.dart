import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wind_notes/anasayfa.dart';

import 'Giris/controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final userC = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    logincontrol();
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.blue.shade500,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/1490.gif',
                scale: 2.4,
              ),
              SizedBox(
                height: Get.height / 10,
              ),
              Text(
                'Wind Notes',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold, fontSize: 28),
              )
            ],
          ),
        ),
      ),
    );
  }

  logincontrol() async {
    var giris = await userC.loginController();
    log('giris $giris');
    if (giris == true) {
      Get.off(Anasayfa());
    }
  }
}
