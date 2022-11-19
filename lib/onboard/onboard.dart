import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wind_notes/AuthPages/kayit_ol.dart';
import 'package:wind_notes/onboard/onboard_controller.dart';

class OnBoard extends StatelessWidget {
  OnBoard({super.key});
  final onboardC = Get.put(OnboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Obx((() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      onboardC.sayfa.value > 0
                          ? IconButton(
                              onPressed: (() {
                                onboardC.sayfaBack();
                              }),
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.blue,
                              ))
                          : const SizedBox(),
                      onboardC.sayfa.value < 2
                          ? TextButton(
                              onPressed: (() {
                                Get.to(() => const KayitOlPage());
                              }),
                              child: const Text(
                                'Atla',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                  Expanded(child: Image.asset(onboardC.onboardveri[0])),
                  const SizedBox(
                    height: 15,
                  ),
                  const LinearProgressIndicator(
                    value: 0.3,
                    minHeight: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    onboardC.onboardveri[1],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    onboardC.onboardveri[2],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  onboardC.sayfa.value < 2
                      ? SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (() {
                              onboardC.sayfanext();
                            }),
                            child: const Text('İleri'),
                          ),
                        )
                      : SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (() {
                              Get.to(() => const KayitOlPage());
                            }),
                            child: const Text('Kullanmaya Başla'),
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              );
            }))),
      ),
    );
  }
}
