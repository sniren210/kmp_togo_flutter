import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kmp_togo_mobile/apis/settings/privacyPolicy_api.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/models/settings/privacyPolicy_model.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  ItemModelPrivacyPolicy? modelPrivacyPolicy;
  bool lookUpPrivacyPolicyDone = false;

  getPrivacyPolicy() async {
    try {
      modelPrivacyPolicy = await privacyPolicyApi.fetchPrivacyPolicy();

      setState(() {
        lookUpPrivacyPolicyDone = true;
      });
    } catch (e) {
      await customSnackbar(type: 'error', title: 'error', text: e.toString());
    }
  }

  @override
  void initState() {
    getPrivacyPolicy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan & Privasi'),
      ),
      body: !lookUpPrivacyPolicyDone
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(child: Html(data: modelPrivacyPolicy!.data.value)),
    );
  }
}
