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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Image.asset(
                    onboardC.onboardveri[0],
                    width: Get.size.height * 0.4,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LinearProgressIndicator(
                    value: onboardC.sayfa.value * 0.33 + 0.34,
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
                            child: const Text('??leri'),
                          ),
                        )
                      : SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (() {
                              Get.to(() => const KayitOlPage());
                            }),
                            child: const Text('Kullanmaya Ba??la'),
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
