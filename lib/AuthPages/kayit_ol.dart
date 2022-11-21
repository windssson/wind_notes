import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wind_notes/AuthPages/controller.dart';
import 'package:wind_notes/AuthPages/giris_yap.dart';
import 'package:wind_notes/anasayfa.dart';

class KayitOlPage extends StatefulWidget {
  const KayitOlPage({super.key});

  @override
  State<KayitOlPage> createState() => _KayitOlPageState();
}

class _KayitOlPageState extends State<KayitOlPage> {
  String _email = '', _password = '';
  final _formkey = GlobalKey<FormState>();
  final userkontrol = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
          child: Column(
            children: [
              Text('Kayıt Ol',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                'assets/images/signup.jpg',
                height: Get.size.height / 3,
              ),
              Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: 'Email',
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (!EmailValidator.validate(value!)) {
                          return 'Email adresini giriniz';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        _email = newValue!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: 'Şifre',
                        hintText: 'Şifre',
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value!.length <= 8) {
                          return 'Şifre en az 8 karakter';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        _password = newValue!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: (() async {
                          bool validate = _formkey.currentState!.validate();
                          if (validate) {
                            _formkey.currentState!.save();
                            var sonuc =
                                await userkontrol.usernameControl(_email);
                            if (sonuc) {
                              var kayitsonuc = await userkontrol.createUser(
                                  _email, _password);
                              if (kayitsonuc) {
                                Get.to(() => const Anasayfa());
                              } else {
                                Get.snackbar('Hata',
                                    'Üye olurken hata oluştu. Daha sonra tekrar deneyiniz.');
                              }
                            } else {
                              Get.snackbar(
                                  'Hata', 'Email adresi zaten Kayıtlı');
                            }
                          } else {
                            Get.snackbar(
                                'Hata', 'Bütün Alanları eksiksiz doldurun.');
                          }
                        }),
                        child: const Text('Kayıt Ol'),
                      ),
                    ),
                    TextButton(
                        onPressed: (() {
                          Get.off(() => const GirisYapPage());
                        }),
                        child: const Text('Hemen Giriş Yap'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
