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
              child: SizedBox(height: 60),
            ),
            model.busy
                ? CustomSettingsSection(
                    child: Center(child: CircularProgressIndicator()))
                // ? const CustomSettingsSection(
                //     child: SizedBox(
                //         child: MainProfile(
                //       name: "Inky pramudia ramdhani",
                //       email: "inkypramudia27@gmail.com  ",
                //       token: 3454948.332,
                //       memberType: "admin",
                //       status: "pacaran",
                //     )),
                //   ) inky
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
              title: const titleSection(
                title: "Pengaturan Umun",
              ),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.history)),
                  title: const Text('History'),
                  trailing: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                  onPressed: (value) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(selectedIndex: 2)));
                  },
                ),
                SettingsTile.navigation(
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black.withOpacity(0.1),
                    ),
                    child: Icon(Icons.location_city),
                  ),
                  title: const Text('Alamat Saya'),
                  trailing: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 15,
                      )),
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
              title: const titleSection(
                title: "Kebijakan dan Tentang",
              ),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  onPressed: (value) {
                    Get.toNamed('/privacyPolicy');
                  },
                  leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.branding_watermark_rounded)),
                  title: const Text('Kebijakan dan privasi'),
                  trailing: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                ),
                SettingsTile.navigation(
                  leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.people)),
                  title: const Text('About us'),
                  trailing: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
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
              title: const titleSection(
                title: "Aplikasi",
              ),
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
                  leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.logout)),
                  title:
                      const Text('Keluar', style: TextStyle(color: Colors.red)),
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
