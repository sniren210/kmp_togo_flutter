import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_auth.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordPages extends StatefulWidget {
  String? number;
  ChangePasswordPages({super.key, this.number});

  @override
  State<ChangePasswordPages> createState() => _ChangePasswordPagesState();
}

class _ChangePasswordPagesState extends State<ChangePasswordPages> {
  bool passhide = true;
  bool passhide1 = true;
  bool passhide2 = true;
  bool loading = false;
  TextEditingController recoverytokencontroller = TextEditingController();
  TextEditingController passnewcontroller = TextEditingController();
  TextEditingController passnew2controller = TextEditingController();
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  final _formKey = GlobalKey<FormState>();

  changepasswprdOld(String? password, String? token) async {
    if (_formKey.currentState!.validate()) {
      await Provider.of<ProviderAuthLogin>(context, listen: false)
          .changePass(context, widget.number, password, token);
      setState(() {
        loading = Provider.of<ProviderAuthLogin>(context, listen: false)
            .loadingLupaPasswordA;
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
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  margin: const EdgeInsets.only(right: 20.0, left: 20),
                  child: TextFormField(
                    obscureText: passhide1,
                    controller: passnewcontroller,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: _focusNodes[1].hasFocus
                              ? const Color(0xFF85014e)
                              : Colors.grey.shade400,
                          size: 7.w,
                        ),
                        labelText: "Enter New Password",
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            icon: Icon(
                              passhide
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _focusNodes[1].hasFocus
                                  ? const Color(0xFF85014e)
                                  : Colors.grey.shade400,
                              size: 7.w,
                            ),
                            onPressed: () {
                              setState(() {
                                passhide1 = !passhide1;
                              });
                            })),
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "You must enter password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  margin: const EdgeInsets.only(right: 20.0, left: 20),
                  child: TextFormField(
                    obscureText: passhide2,
                    controller: passnew2controller,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: _focusNodes[2].hasFocus
                              ? const Color(0xFF85014e)
                              : Colors.grey.shade400,
                          size: 7.w,
                        ),
                        labelText: "Enter Repeat Password",
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            icon: Icon(
                              passhide
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _focusNodes[1].hasFocus
                                  ? const Color(0xFF85014e)
                                  : Colors.grey.shade400,
                              size: 7.w,
                            ),
                            onPressed: () {
                              setState(() {
                                passhide2 = !passhide2;
                              });
                            })),
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "You must enter password";
                      } else if (password != passnewcontroller.text) {
                        return "You must enter doest match";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0, left: 20),
                  child: TextFormField(
                    // obscureText: passhide,

                    // keyboardType: TextInputType.phone,
                    controller: recoverytokencontroller,
                    decoration: const InputDecoration(
                        // contentPadding:
                        //     const EdgeInsets.symmetric(vertical: 20),
                        // prefixIcon: Icon(
                        //   Icons.phone_android,
                        //   color: _focusNodes[0].hasFocus
                        //       ? Color(0xFF85014e)
                        //       : Colors.grey.shade400,
                        //   size: 7.w,
                        // ),

                        labelText: "Masukan Token Recovery",
                        border: OutlineInputBorder(),
                        // border: InputBorder.none,
                        // hintText: 'Masukan Nomor Telphone',
                        hintStyle: TextStyle(fontSize: 17)
                        // suffixIcon: IconButton(
                        //     icon: Icon(
                        //       passhide ? Icons.visibility_off : Icons.visibility,
                        //       color: _focusNodes[1].hasFocus
                        //           ? Color(0xFF85014e)
                        //           : Colors.grey.shade400,
                        //       size: 7.w,
                        //     ),
                        //     onPressed: () {
                        //       setState(() {
                        //         passhide = !passhide;
                        //       });
                        //     })
                        ),
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "Masukan Token Recovery";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                loading == false
                    ? Padding(
                        padding: const EdgeInsets.only(
                            right: 20.0, left: 20.0, top: 40),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              loading = true;
                            });
                            changepasswprdOld(passnewcontroller.text,
                                recoverytokencontroller.text);
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
                                height: 2.h,
                                width: 4.w,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
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
