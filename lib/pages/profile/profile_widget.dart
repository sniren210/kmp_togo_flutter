import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/providers/account/provider_account.dart';
import 'package:provider/provider.dart';

class MainProfile extends StatefulWidget {
  final String name;
  final String email;
  final double token;
  final String memberType;
  final String status;

  const MainProfile({
    Key? key,
    required this.name,
    required this.email,
    required this.token,
    required this.memberType,
    required this.status,
  }) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> with NumberFormatMachine {
  bool? isLoading = true;

  startTime() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProviderAccountInfo>(
      model: ProviderAccountInfo(Repository()),
      onModelReady: (model) => model.fetchAccountInfo(),
      child: Container(),
      builder: (context, model, child) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 37,
                    backgroundImage: AssetImage('assets/images/logon.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 23,
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.orange,
                      ),
                      child: Icon(
                        Icons.email,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Text(
                widget.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                '${getNumberFormatSeparator(widget.token)} Poin',
                style: const TextStyle(fontSize: 14),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget.memberType,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ),
                  const HorizontalSpacer(width: 15),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: getColorByStatus(widget.status),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget.status,
                        style:
                            TextStyle(color: Colors.black87, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getColorByStatus(status) {
    if (status == 'active') return Colors.green.shade300;
    if (status == 'inactive') return Colors.orange.shade300;
    return Colors.grey.shade300;
  }
}
