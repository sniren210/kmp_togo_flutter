import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kmp_togo_mobile/apis/settings/about_us_api.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/models/settings/aboutUs_model.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  ItemModelAboutUs? modelAboutUs;
  bool lookUpAboutUsDone = false;

  getAboutUs() async {
    try {
      modelAboutUs = await aboutUsApi.fetchAboutUs();

      setState(() {
        lookUpAboutUsDone = true;
      });
    } catch (e) {
      await customSnackbar(type: 'error', title: 'error', text: e.toString());
    }
  }

  @override
  void initState() {
    getAboutUs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: !lookUpAboutUsDone
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(child: Html(data: modelAboutUs!.data.value)),
    );
  }
}
