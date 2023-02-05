import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/pages/nft/mynftProdusen.dart';
import 'package:kmp_togo_mobile/pages/produsennft/dashboardmynftproduk.dart';
import 'package:kmp_togo_mobile/pages/profile/address/alamatPage.dart';
import 'package:kmp_togo_mobile/pages/profile/profile_widget.dart';
import 'package:kmp_togo_mobile/providers/account/provider_account.dart';
import 'package:kmp_togo_mobile/providers/cart/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

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
              child: SizedBox(height: 50),
            ),
            model.busy
                ? const CustomSettingsSection(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : CustomSettingsSection(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.height / 0.5,
                        child: MainProfile(
                          name: model.items!.data.name,
                          email: model.items!.data.email,
                          token: model.items!.data.tokenWallet.token,
                          memberType: model.items!.data.membertype,
                          status: model.items!.data.status,
                        )),
                  ),
            SettingsSection(
              title: const Text('Pengaturan Umum'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.history),
                  title: const Text('History'),
                  onPressed: (value) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(selectedIndex: 2)));
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.location_city),
                  title: const Text('Alamat Saya'),
                  onPressed: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AlamatPage()));
                  },
                ),
                model.busy
                    ? SettingsTile(
                        title: Container(),
                      )
                    : buildNavigationByMember(model),
              ],
            ),
            SettingsSection(
              title: const Text('Kebijakan & Tentang'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  onPressed: (value) {
                    Get.toNamed('/privacyPolicy');
                  },
                  leading: const Icon(Icons.branding_watermark_rounded),
                  title: const Text('Kebijakan Privasi'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.people),
                  title: const Text('About Us'),
                  onPressed: (value) {
                    Get.toNamed('/aboutUs');
                  },
                ),
                // SettingsTile.navigation(
                //   leading: const Icon(Icons.download),
                //   title: const Text('Download Excel (API List)'),
                //   onPressed: (value) {
                //     createExcel(AppDb().getResponse().then((value) => value));
                //   },
                // ),
              ],
            ),
            SettingsSection(
              title: const Text('Aplikasi'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  onPressed: (val) {
                    final SharedPreferencesManager sharedPreferencesManager =
                        locator<SharedPreferencesManager>();

                    // cart.resetCounter();
                    //
                    sharedPreferencesManager.clearAll();

                    Get.offAllNamed('/login');
                  },
                  leading: const Icon(Icons.branding_watermark_rounded),
                  title: const Text('Keluar'),
                ),
              ],
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
    String memberType = model.items!.data.membertype.toLowerCase();
    if (memberType == 'produsen' ||
        memberType == 'konsumen1' ||
        memberType == 'umkm') {
      return SettingsTile.navigation(
        onPressed: (value) {
          switch (model.items!.data.membertype.toLowerCase()) {
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
        title: buildButtonMember(model.items!.data.membertype.toLowerCase()),
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
