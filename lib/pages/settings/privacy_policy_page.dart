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

  // getPrivacyPolicy() async {
  //   try {
  //     modelPrivacyPolicy = await privacyPolicyApi.fetchPrivacyPolicy();

  //     setState(() {
  //       lookUpPrivacyPolicyDone = true;
  //     });
  //   } catch (e) {
  //     await customSnackbar(type: 'error', title: 'error', text: e.toString());
  //   }
  // }

  @override
  void initState() {
    // getPrivacyPolicy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan & Privasi'),
      ),
      body: SingleChildScrollView(
              child: Html(
                  data:
                      'Kebijakan Privasi Website https://admin.digitogo.tech/login dimiliki oleh Digitogo tech, yang akan menjadi pengontrol atas data pribadi Anda. Kami telah mengadopsi Kebijakan Privasi ini untuk menjelaskan bagaimana kami memproses informasi yang dikumpulkan oleh https://admin.digitogo.tech/login, yang juga menjelaskan alasan mengapa kami perlu mengumpulkan data pribadi tertentu tentang Anda. Oleh karena itu, Anda harus membaca Kebijakan Privasi ini sebelum menggunakan website https://admin.digitogo.tech/login. Kami menjaga data pribadi Anda dan berjanji untuk menjamin kerahasiaan dan keamanannya. Informasi pribadi yang kami kumpulkan: Saat Anda mengunjungi https://admin.digitogo.tech/login, kami secara otomatis mengumpulkan informasi tertentu mengenai perangkat Anda, termasuk informasi tentang browser web, alamat IP, zona waktu, dan sejumlah cookie yang terinstal di perangkat Anda. Selain itu, selama Anda menjelajahi Website, kami mengumpulkan informasi tentang setiap halaman web atau produk yang Anda lihat, website atau istilah pencarian apa yang mengarahkan Anda ke Website, dan cara Anda berinteraksi dengan Website. Kami menyebut informasi yang dikumpulkan secara otomatis ini sebagai "Informasi Perangkat". Kemudian, kami mungkin akan mengumpulkan data pribadi yang Anda berikan kepada kami (termasuk tetapi tidak terbatas pada, Nama, Nama belakang, Alamat, informasi pembayaran, dll.) selama pendaftaran untuk dapat memenuhi perjanjian. Mengapa kami memproses data Anda? Menjaga data pelanggan agar tetap aman adalah prioritas utama kami. Oleh karena itu, kami hanya dapat memproses sejumlah kecil data pengguna, sebanyak yang benar-benar diperlukan untuk menjalankan website. Informasi yang dikumpulkan secara otomatis hanya digunakan untuk mengidentifikasi kemungkinan kasus penyalahgunaan dan menyusun informasi statistik terkait penggunaan website. Informasi statistik ini tidak digabungkan sedemikian rupa hingga dapat mengidentifikasi pengguna tertentu dari sistem. Anda dapat mengunjungi website tanpa memberi tahu kami identitas Anda atau mengungkapkan informasi apa pun, yang dapat digunakan oleh seseorang untuk mengidentifikasi Anda sebagai individu tertentu yang dapat dikenali. Namun, jika Anda ingin menggunakan beberapa fitur website, atau Anda ingin menerima newsletter kami atau memberikan detail lainnya dengan mengisi formulir, Anda dapat memberikan data pribadi kepada kami, seperti email, nama depan, nama belakang, kota tempat tinggal, organisasi, dan nomor telepon Anda. Anda dapat memilih untuk tidak memberikan data pribadi Anda kepada kami, tetapi Anda mungkin tidak dapat memanfaatkan beberapa fitur website. Contohnya, Anda tidak akan dapat menerima Newsletter kami atau menghubungi kami secara langsung dari website. Pengguna yang tidak yakin tentang informasi yang wajib diberikan dapat menghubungi kami melalui founder@digitogo.tech. Hak-hak Anda: Jika Anda seorang warga Eropa, Anda memiliki hak-hak berikut terkait data pribadi Anda: Hak untuk mendapatkan penjelasan. Hak atas akses. Hak untuk memperbaiki. Hak untuk menghapus. Hak untuk membatasi pemrosesan. Hak atas portabilitas data. Hak untuk menolak. Hak-hak terkait pengambilan keputusan dan pembuatan profil otomatis. Jika Anda ingin menggunakan hak ini, silakan hubungi kami melalui informasi kontak di bawah ini. Selain itu, jika Anda seorang warga Eropa, perlu diketahui bahwa kami akan memproses informasi Anda untuk memenuhi kontrak yang mungkin kami miliki dengan Anda (misalnya, jika Anda melakukan pemesanan melalui Website), atau untuk memenuhi kepentingan bisnis sah kami seperti yang tercantum di atas. Di samping itu, harap diperhatikan bahwa informasi Anda mungkin dapat dikirim ke luar Eropa, termasuk Kanada dan Amerika Serikat. Link ke website lain: Website kami mungkin berisi tautan ke website lain yang tidak dimiliki atau dikendalikan oleh kami. Perlu diketahui bahwa kami tidak bertanggung jawab atas praktik privasi website lain atau pihak ketiga. Kami menyarankan Anda untuk selalu waspada ketika meninggalkan website kami dan membaca pernyataan privasi setiap website yang mungkin mengumpulkan informasi pribadi. Keamanan informasi: Kami menjaga keamanan informasi yang Anda berikan pada server komputer dalam lingkungan yang terkendali, aman, dan terlindungi dari akses, penggunaan, atau pengungkapan yang tidak sah. Kami menjaga pengamanan administratif, teknis, dan fisik yang wajar untuk perlindungan terhadap akses, penggunaan, modifikasi, dan pengungkapan tidak sah atas data pribadi dalam kendali dan pengawasannya. Namun, kami tidak menjamin tidak akan ada transmisi data melalui Internet atau jaringan nirkabel. Pengungkapan hukum: Kami akan mengungkapkan informasi apa pun yang kami kumpulkan, gunakan, atau terima jika diwajibkan atau diizinkan oleh hukum, misalnya untuk mematuhi panggilan pengadilan atau proses hukum serupa, dan jika kami percaya dengan itikad baik bahwa pengungkapan diperlukan untuk melindungi hak kami, melindungi keselamatan Anda atau keselamatan orang lain, menyelidiki penipuan, atau menanggapi permintaan dari pemerintah. Informasi kontak: Jika Anda ingin menghubungi kami untuk mempelajari Kebijakan ini lebih lanjut atau menanyakan masalah apa pun yang berkaitan dengan hak perorangan dan Informasi pribadi Anda, Anda dapat mengirim email ke founder@digitogo.tech.')),
    );
  }
}
