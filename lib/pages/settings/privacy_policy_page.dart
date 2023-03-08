import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kmp_togo_mobile/apis/settings/privacyPolicy_api.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/models/privacy_policy_model.dart';
import 'package:kmp_togo_mobile/models/settings/privacyPolicy_model.dart';

class SettingsAboutPage extends StatefulWidget {
  final String settings;
  const SettingsAboutPage({Key? key, required this.settings}) : super(key: key);

  @override
  State<SettingsAboutPage> createState() => _SettingsAboutPageState();
}

class _SettingsAboutPageState extends State<SettingsAboutPage> {
  late PrivacyPolicyModel modelPrivacyPolicy;
  bool lookUpPrivacyPolicyDone = false;

  getPrivacyPolicy() async {
    try {
      modelPrivacyPolicy =
          await privacyPolicyApi.fetchPrivacyPolicy(widget.settings == 'tos'
              ? 'get-tos'
              : widget.settings == 'about'
                  ? 'get-about'
                  : 'get-member-rules');

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
        title: Text(widget.settings == 'tos'
            ? 'Kebijakan & Privasi'
            : widget.settings == 'about'
                ? 'Tentang kmptogo'
                : 'Peraturan Anggota'),
      ),
      body: !lookUpPrivacyPolicyDone
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(child: Builder(builder: (context) {
              return Html(data: modelPrivacyPolicy.data.description);
            })),
    );
  }
}
