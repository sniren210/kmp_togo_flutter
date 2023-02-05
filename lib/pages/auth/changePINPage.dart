import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerPage.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_auth.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChangePINPage extends StatefulWidget {
  const ChangePINPage({super.key});

  @override
  State<ChangePINPage> createState() => _ChangePINPageState();
}

class _ChangePINPageState extends State<ChangePINPage> {
  final _formKey = GlobalKey<FormState>();
  bool passhide = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  CountdownTimerController? Coundowncontroller;
  int? endTime;
  bool pinaltytime = false;
  bool bannedtime = false;
  int wrongLogin = 0;
  bool? loading = false;

  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      await Provider.of<ProviderAuthChangePIN>(context, listen: false)
          .changePIN(nameController.text, passcontroller.text);
      setState(() {
        loading =
            Provider.of<ProviderAuthChangePIN>(context, listen: false).loading;
      });
      // if (wrongLogin == 3) {
      //   setState(() {
      //     showWronglogin = true;
      //   });
      // }
    }
  }

  void onEnd() {
    debugPrint('onEnd');
    setState(() {
      pinaltytime = false;
    });
  }

  @override
  void initState() {
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF85014e),
        elevation: 0,
        title: Text('Ubah PIN'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
              ),
              bannedtime == true
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.only(right: 20.0, left: 20),
                      child: TextFormField(
                        focusNode: _focusNodes[0],
                        controller: nameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          prefixIcon: Icon(
                            Icons.person,
                            color: _focusNodes[0].hasFocus
                                ? Color(0xFF85014e)
                                : Colors.grey.shade400,
                            size: 7.w,
                          ),
                          hintText: "Old Password",
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF85014e),
                            ),
                          ),
                        ),
                        validator: (username) {
                          if (username!.isEmpty) {
                            return "You must enter username";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
              bannedtime == true
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.only(top: 20),
                      margin: const EdgeInsets.only(right: 20.0, left: 20),
                      child: TextFormField(
                        obscureText: passhide,
                        focusNode: _focusNodes[1],
                        controller: passcontroller,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: _focusNodes[1].hasFocus
                                  ? Color(0xFF85014e)
                                  : Colors.grey.shade400,
                              size: 7.w,
                            ),
                            labelText: "New Password",
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  passhide
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: _focusNodes[1].hasFocus
                                      ? Color(0xFF85014e)
                                      : Colors.grey.shade400,
                                  size: 7.w,
                                ),
                                onPressed: () {
                                  setState(() {
                                    passhide = !passhide;
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
              bannedtime == true
                  ? Container()
                  : loading == false
                  ? InkWell(
                onTap: () {
                  _submit();
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        right: 20.0, left: 20.0, top: 40),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xFF85014e)),
                    child: const Text(
                      'Ubah',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    )),
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
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey),
                    child: Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        height: 2.h,
                        width: 4.w,
                      ),
                    )),
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
