import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/history/jenis_transaksi.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/pages/nft/mynftProdusen.dart';
import 'package:kmp_togo_mobile/pages/produsennft/dashboardmynftproduk.dart';
import 'package:kmp_togo_mobile/pages/profile/address/alamatPage.dart';
import 'package:kmp_togo_mobile/pages/profile/profile_detail.dart';
import 'package:kmp_togo_mobile/pages/profile/profile_widget.dart';
import 'package:kmp_togo_mobile/pages/profile/transaksi/transaksi_page.dart';
import 'package:kmp_togo_mobile/providers/account/provider_account.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_auth.dart';
import 'package:kmp_togo_mobile/providers/cart/cart_provider.dart';
import 'package:kmp_togo_mobile/providers/database/database.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import 'iuran_pokok.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProviderAccountInfo>(
      model: ProviderAccountInfo(Repository()),
      onModelReady: (model) => model.fetchAccountInfo(),
      child: Container(),
      builder: (context, model, child) => Consumer<CartProvider>(
          builder: (BuildContext context, provider, widget) {
        return SettingsList(
          applicationType: Platform.isIOS
              ? ApplicationType.cupertino
              : ApplicationType.material,
          shrinkWrap: true,
          sections: [
            const CustomSettingsSection(
              child: SizedBox(height: 60),
            ),
            model.busy
                // ? CustomSettingsSection(
                //     child: Center(child: CircularProgressIndicator()))
                ? CustomSettingsSection(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const MainProfile(
                          name: "",
                          email: "",
                          token: 0,
                          memberType: "",
                          status: "",
                        ),
                      ),
                    ),
                  )
                : CustomSettingsSection(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: MainProfile(
                          name: model.items!.user.name,
                          email: model.items!.user.email,
                          token: 0,
                          // token: model.items!.user.tokenWallet.token,
                          memberType: model.items!.user.role,
                          status: model.items!.user.status.toLowerCase(),
                        ),
                      ),
                    ),
                  ),
            CustomSettingsSection(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      titleSection(title: "Pengaturan Member"),
                      SettingsTile(
                        leading: Icon(Icons.money),
                        title: Text(
                          "Iuran pokok dan wajib",
                          style: const TextStyle(fontSize: 15),
                        ),
                        onPressed: (value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => iuranPokok(),
                            ),
                          );
                        },
                      ),
                      SettingsTile(
                        leading: Icon(Icons.store_mall_directory),
                        title: Text(
                          "Alamat marketplace",
                          style: const TextStyle(fontSize: 15),
                        ),
                        onPressed: (value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AlamatPage()));
                        },
                      ),
                      titleSection(title: "Pengaturan Umun"),
                      SettingsTile(
                        leading: Icon(Icons.account_circle),
                        title: Text(
                          "Profile detail",
                          style: const TextStyle(fontSize: 15),
                        ),
                        onPressed: (value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => profileDetail()));
                        },
                      ),
                      SettingsTile(
                        leading: Icon(Icons.history),
                        title: Text(
                          "history",
                          style: const TextStyle(fontSize: 15),
                        ),
                        onPressed: (value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TransaksiPage()));
                        },
                      ),
                      titleSection(title: "Kebijakan dan tentang"),
                      SettingsTile(
                        leading: Icon(Icons.branding_watermark_rounded),
                        title: Text(
                          "Kebijakan dan privasi",
                          style: const TextStyle(fontSize: 15),
                        ),
                        onPressed: (value) {
                          Get.toNamed('/privacyPolicy');
                        },
                      ),
                      SettingsTile(
                        leading: Icon(Icons.branding_watermark_outlined),
                        title: Text(
                          "Peraturan anggota",
                          style: const TextStyle(fontSize: 15),
                        ),
                        onPressed: (value) {
                          Get.toNamed('/privacyPolicy');
                        },
                      ),
                      SettingsTile(
                        leading: Icon(Icons.people),
                        title: Text(
                          "About us",
                          style: const TextStyle(fontSize: 15),
                        ),
                        onPressed: (value) {
                          Get.toNamed('/aboutUs');
                        },
                      ),
                      titleSection(title: "Aplikasi"),
                      SettingsTile(
                        leading: Icon(Icons.logout),
                        title: Text(
                          "Keluar",
                          style:
                              const TextStyle(fontSize: 15, color: Colors.red),
                        ),
                        onPressed: (val) async {
                          final SharedPreferencesManager
                              sharedPreferencesManager =
                              locator<SharedPreferencesManager>();

                          sharedPreferencesManager.clearAll();

                          await Provider.of<ProviderAuthLogin>(context,
                                  listen: false)
                              .logout();

                          Get.offAllNamed('/login');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CustomSettingsSection(
              child: SizedBox(height: 30),
            ),
          ],
        );
      }),
    );
  }

  buildNavigationByMember(ProviderAccountInfo model) {
    String memberType = model.items!.user.role.toLowerCase();
    if (memberType == 'produsen' ||
        memberType == 'konsumen1' ||
        memberType == 'umkm') {
      return SettingsTile.navigation(
        onPressed: (value) {
          switch (model.items!.user.role.toLowerCase()) {
            case 'produsen':
              Get.to(() => DashboardMyNFTKonsumen());
              break;
            case 'konsumen1':
              Get.to(() => MyNFTProdusen());
              break;
            case 'umkm':
              Get.toNamed('/umkmProduct');
              break;
          }
        },
        leading: const Icon(Icons.shopping_cart),
        title: buildButtonMember(model.items!.user.role.toLowerCase()),
      );
    }
    return SettingsTile(
      title: Container(),
    );
  }

  Widget buildButtonMember(String memberType) {
    switch (memberType) {
      case 'produsen':
        return const Text('NFT Saya');
      case 'konsumen1':
        return const Text('NFT Saya');
      case 'umkm':
        return const Text('Produk Saya');
    }
    return Container();
  }
}

class listSetting extends StatelessWidget {
  const listSetting({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
      onPressed: (value) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Home(selectedIndex: 2)));
      },
    );
  }
}

class titleSection extends StatelessWidget {
  const titleSection({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //   decoration: BoxDecoration(
    //     color: Theme.of(context).primaryColor,
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   ch122ild: Text(
    //     title,
    //     style: const TextStyle(color: Colors.white, fontSize: 14),
    //   ),
    // );
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
