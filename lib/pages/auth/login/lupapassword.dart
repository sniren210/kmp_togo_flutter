import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LupaPassword extends StatefulWidget {
  const LupaPassword({super.key});

  @override
  State<LupaPassword> createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  String _pinValue = '';
  bool passhide = true;
  bool passhide1 = true;
  bool passhide2 = true;
  bool loading = false;
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController passnewcontroller = TextEditingController();
  TextEditingController passnew2controller = TextEditingController();
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  final _formKey = GlobalKey<FormState>();

  bool isPin = false;

  changepasswprd(String? number) async {
    if (_formKey.currentState!.validate() && _pinValue.isNotEmpty) {
      await Provider.of<ProviderAuthLogin>(context, listen: false)
          .kirimotpresetPass(context, number, _pinValue);
      setState(() {
        loading = Provider.of<ProviderAuthLogin>(context, listen: false)
            .loadingLupaPassword;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text('Lupa Password'),
          // ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 5.h),
                  height: 25.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/logon.jpg'))),
                ),
                Container(
                    margin: EdgeInsets.only(top: 7.h, left: 5.w, right: 5.w),
                    child: Text(
                      'Lupa Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19.sp),
                    )),
                if (isPin)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Pinput(
                      length: 6,
                      obscureText: true,
                      onChanged: (pin) {
                        setState(() {
                          _pinValue = pin;
                        });
                      },
                    ),
                  )
                else ...[
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    margin: const EdgeInsets.only(right: 20.0, left: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: numbercontroller,
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              '+62',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: InputBorder.none,
                          hintText: 'Masukan Nomor Telephone',
                          hintStyle: TextStyle(fontSize: 17)),
                      validator: (password) {
                        if (password!.isEmpty) {
                          return "Masukan Nomor Telphone";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
                loading == false
                    ? Padding(
                        padding: const EdgeInsets.only(
                            right: 20.0, left: 20.0, top: 40),
                        child: InkWell(
                          onTap: () {
                            if (!isPin) {
                              setState(() {
                                isPin = true;
                              });
                              return;
                            }

                            setState(() {
                              loading = true;
                            });
                            changepasswprd(numbercontroller.text);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 70),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: const Color(0xFF85014e)),
                            child: const Text(
                              'Simpan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {},
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                right: 20.0, left: 20.0, top: 40),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 70),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.grey),
                            child: Center(
                              child: SizedBox(
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                                height: 2.h,
                                width: 4.w,
                              ),
                            )),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
