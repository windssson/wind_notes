import 'dart:developer';

import 'package:get/get.dart';

class OnboardController extends GetxController {
  RxInt sayfa = 0.obs;
  List<String> onboardveri = [
    'assets/images/1060.png',
    'Notlarınızı Kolayca Oluşturun ve Yönetin',
    'Notlarınızı oluşturmanın ve yönetmenin en kolay yolu. \n Hemen oluşturun'
  ].obs;

  sayfanext() {
    if (sayfa.value < 2) {
      sayfa.value += 1;
    }
    log(sayfa.value.toString());
    veriGuncelle();
  }

  sayfaBack() {
    if (sayfa.value > 0) {
      sayfa.value -= 1;
    }
    log(sayfa.value.toString());
    veriGuncelle();
  }

  veriGuncelle() {
    if (sayfa.value == 0) {
      onboardveri[0] = 'assets/images/1060.png';
      onboardveri[1] = 'Notlarınızı Kolayca Oluşturun ve Yönetin';
      onboardveri[2] =
          'Notlarınızı oluşturmanın ve yönetmenin en kolay yolu. \n Hemen oluşturun';
    } else if (sayfa.value == 1) {
      onboardveri[0] = 'assets/images/1070.png';
      onboardveri[1] = 'Düşüncelerinizi Hemen Yazın';
      onboardveri[2] = 'En hızlı not alma uygulaması';
    } else if (sayfa.value == 2) {
      onboardveri[0] = 'assets/images/1080.png';
      onboardveri[1] = 'Kolayca Yazıp Kaydedin';
      onboardveri[2] = 'Not Almak hiç bu kadar kolay olmamıştı';
    }
  }
}
