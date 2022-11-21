import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wind_notes/AuthPages/controller.dart';
import 'package:wind_notes/AuthPages/giris_yap.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final userC = Get.put(UserController());
  @override
  void initState() {
    super.initState();
    loginControl();
  }

  loginControl() async {
    var giris = await userC.loginControl();
    if (!giris) {
      Get.to(const GirisYapPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anasayfa'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (() async {
              var sonuc = await userC.logout();
              if (sonuc) {
                Get.off(() => const GirisYapPage());
              }
            }),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text('Login Success'),
      ),
    );
  }
}
