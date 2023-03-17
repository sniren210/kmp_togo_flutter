// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/formInputField.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/auth/register/enterpinregister.dart';
import 'package:kmp_togo_mobile/pages/settings/privacy_policy_page.dart';
import 'package:sizer/sizer.dart';

class RegisterMakeAccountPage extends StatefulWidget {
  const RegisterMakeAccountPage({Key? key}) : super(key: key);

  @override
  State<RegisterMakeAccountPage> createState() =>
      _RegisterMakeAccountPageState();
}

class _RegisterMakeAccountPageState extends State<RegisterMakeAccountPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? emailC, passwordC, passwordValC, kodeRef;
  bool passhide = true;
  bool passhide1 = true;

  String termText = 'Kebijakan privasi dan Peraturan anggota';
  Map<String, bool> terms_conditions = {
    'Kebijakan privasi dan Peraturan anggota': false,
  };

  bool validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (value.isEmpty) {
      return false;
    } else {
      if (!regex.hasMatch(value)) {
        return false;
      } else {
        return true;
      }
    }
  }

  @override
  void initState() {
    emailC = TextEditingController();
    passwordC = TextEditingController();
    passwordValC = TextEditingController();
    kodeRef = TextEditingController();

    super.initState();
  }

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  void _submit() async {
    if (emailC!.text.isNotEmpty &&
        passwordC!.text.isNotEmpty &&
        passwordValC!.text.isNotEmpty) {
      if (validatePassword(passwordC!.text) == true) {
        if (_formKey.currentState!.validate()) {
          if (passwordC!.text == passwordValC!.text) {
            await sharedPreferencesManager.setString(
                SharedPreferencesManager.email, emailC!.text);
            await sharedPreferencesManager.setString(
                SharedPreferencesManager.password, passwordC!.text);
            await sharedPreferencesManager.setString(
                SharedPreferencesManager.referral, kodeRef!.text);
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EnterPinRegister()),
            );
          } else {
            await customSnackbar(
                type: 'error', title: 'error', text: "Ulangi password salah");
          }
        }
      } else {
        await customSnackbar(
            type: 'error',
            title: 'error',
            text:
                "Password harus terdiri dari huruf besar, huruf kecil, angka, dan minimal 8 karakter");
      }
    } else {
      await customSnackbar(
          type: 'error',
          title: 'error',
          text: "Email dan password tidak boleh kosong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 110,
                ),
                const Text(
                  'Konfirmasi Data Kamu',
                  textAlign: TextAlign.center,
                  style: TextStyling.titleStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormInput(
                    controller: emailC!,
                    inputType: TextInputType.text,
                    hintText: 'Masukkan email',
                    icon: Icons.email_outlined),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    obscureText: passhide1,
                    controller: passwordC,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'Masukan Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          icon: Icon(
                            passhide1 ? Icons.visibility_off : Icons.visibility,
                            size: 7.w,
                          ),
                          onPressed: () {
                            setState(() {
                              passhide1 = !passhide1;
                            });
                          }),
                      // labelText: 'User Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field can't be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: passwordValC,
                    obscureText: passhide,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'Masukan Ulang Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          icon: Icon(
                            passhide ? Icons.visibility_off : Icons.visibility,
                            size: 7.w,
                          ),
                          onPressed: () {
                            setState(() {
                              passhide = !passhide;
                            });
                          }),
                      // labelText: 'User Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field can't be empty";
                      }
                      if (value != passwordC!.text) {
                        return "Password Tidak Sama";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: kodeRef,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      prefixIcon: const Icon(Icons.account_balance),
                      labelText: 'Masukan Kode Referral (Opsional)',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(0xFF85014e);
                          }
                          return const Color(0xFF000000);
                        }),
                        value: terms_conditions[termText],
                        onChanged: (bool? value) {
                          setState(() {
                            terms_conditions[termText] = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (terms_conditions[termText] == true) {
                                terms_conditions[termText] = false;
                              } else {
                                terms_conditions[termText] = true;
                              }
                            });
                          },
                          child: RichText(
                            text: TextSpan(
                                text: 'saya telah membaca dan menyetujui',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Kebijakan privasi ',
                                      style: TextStyle(
                                        color: const Color(0xFF85014e),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SettingsAboutPage(
                                                        settings: 'tos',
                                                      )));
                                        }),
                                  TextSpan(
                                      text: ' dan ',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to desired screen
                                        }),
                                  TextSpan(
                                      text: '  Peraturan anggota ',
                                      style: TextStyle(
                                        color: const Color(0xFF85014e),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SettingsAboutPage(
                                                        settings: 'member',
                                                      )));
                                        })
                                ]),
                          ),
                          // child: Text(
                          //   'saya telah membaca dan menyetujui $termText',
                          //   style: const TextStyle(fontSize: 12.0),
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if (terms_conditions.values.every((element) => element)) {
                      _submit();
                    } else {
                      customSnackbar(
                          type: 'error',
                          title: 'Perhatian!',
                          text:
                              'Harap centang semua peraturan dan perjanjian yang diminta');
                    }
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF85014e),
                      ),
                      child: const Text(
                        'Lanjutkan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      )),
                ),
                const VerticalSpacer(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildCheckboxItem extends StatefulWidget {
  bool isChecked;
  String content;

  BuildCheckboxItem({Key? key, required this.isChecked, required this.content})
      : super(key: key);

  @override
  State<BuildCheckboxItem> createState() => _BuildCheckboxItemState();
}

class _BuildCheckboxItemState extends State<BuildCheckboxItem> {
  @override
  Widget build(BuildContext context) {
    debugPrint('ASDP');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Checkbox(
            value: widget.isChecked,
            onChanged: (bool? value) {
              setState(() {
                widget.isChecked = value!;
              });
            },
          ),
          Text(
            widget.content,
            style: const TextStyle(fontSize: 17.0),
          ),
        ],
      ),
    );
  }
}
