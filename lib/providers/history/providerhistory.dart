import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/models/history/modelhistory.dart';

import '../../helpers/ui_helper/custom_snackbar.dart';
import '../../models/response/error/model_error.dart';

class ProviderHistory extends ChangeNotifier with ApiMachine {
  final _dio = Helper().dio;
  ModelHistory? dataAllHistory;
  bool? loadingHistory = false;
  getAllHistory(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/history?order=createdAt:desc');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      print('${res.data['data'].length}');
      // dataAllHistory = ModelHistory.fromJson(res.data);
      dataAllHistory = ModelHistory().dummy();
      loadingHistory = false;
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        final msg = e.toString();
        print(msg);
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      }
    } catch (e) {
      print(e);
    }
  }

  getSelectDropdown(context, String? status, String? tanggal) async {
    var now = DateTime.now();
    if (tanggal == '30 Hari Terakhir') {
      String nowSplit = now.toString().substring(0, 10);

      DateTime pastMonth = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);

      tanggal = '${pastMonth.toString().substring(0, 10)}:${nowSplit}';

      print(tanggal);
    } else if (tanggal == '90 Hari Terakhir') {
      var now = DateTime.now();
      String nowSplit = now.toString().substring(0, 10);

      DateTime pastMonth = DateTime(
          DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);

      tanggal = '${pastMonth.toString().substring(0, 10)}:${nowSplit}';

      print(tanggal);
    } else if (tanggal == 'Semua Tanggal Transaksi') {
      getAllHistory(context);
    }
    if (status != null && tanggal == null) {
      print('a');
      try {
        final res =
            await _dio.get('/v1/history?order=createdAt:desc&status=$status');

        await saveResponseGet(
            res.requestOptions.path, res.statusMessage, res.data.toString());

        print('${res.data['data'].length}');
        dataAllHistory = ModelHistory.fromJson(res.data);
        loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    } else if (status != null && tanggal != null) {
      try {
        final res = await _dio.get(
            '/v1/history?order=createdAt:desc&status=${status}&dateRange=$tanggal');

        await saveResponseGet(
            res.requestOptions.path, res.statusMessage, res.data.toString());

        dataAllHistory = ModelHistory.fromJson(res.data);
        loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    } else if (status == null && tanggal != null) {
      print('c');
      try {
        final res = await _dio
            .get('/v1/history?order=createdAt:desc&dateRange=$tanggal');
        print('${res.data['data'].length}');
        dataAllHistory = ModelHistory.fromJson(res.data);
        loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  getFitur(context, String? search, String? status, String? tanggal) async {
    // try {
    //   final res = await _dio.get('/v1/history?search=$search');
    //   print('${res.data['data'].length}');
    //   dataAllHistory = ModelHistory.fromJson(res.data);
    //   loadingHistory = false;
    //   notifyListeners();
    // } on DioError catch (e) {
    //   try {
    //     ErrorModel data = ErrorModel.fromJson(e.response!.data);
    //     await customSnackbar(
    //         type: 'error', title: 'error', text: data.error.toString());
    //   } catch (e) {
    //     final msg = e.toString();
    //     print(msg);
    //     await customSnackbar(
    //         type: 'error', title: 'error', text: 'Terjadi kesalahan!');
    //   }
    // } catch (e) {
    //   print(e);
    // }
    var now = DateTime.now();
    if (status == 'all') {
      status = null;
    }
    if (tanggal == '30 Hari Terakhir') {
      String nowSplit = now.toString().substring(0, 10);

      DateTime pastMonth = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);

      tanggal = '${pastMonth.toString().substring(0, 10)}:${nowSplit}';

      print(tanggal);
    } else if (tanggal == '90 Hari Terakhir') {
      var now = DateTime.now();
      String nowSplit = now.toString().substring(0, 10);

      DateTime pastMonth = DateTime(
          DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);

      tanggal = '${pastMonth.toString().substring(0, 10)}:${nowSplit}';

      print(tanggal);
    } else if (tanggal == 'Semua Tanggal Transaksi') {
      tanggal = null;
    }
    if (search != null && status == null && tanggal == null) {
      try {
        final res =
            await _dio.get('/v1/history?order=createdAt:desc&search=$search');

        await saveResponseGet(
            res.requestOptions.path, res.statusMessage, res.data.toString());

        dataAllHistory = ModelHistory.fromJson(res.data);
        loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {}
    } else if (search != null && status != null && tanggal == null) {
      try {
        final res = await _dio.get(
            '/v1/history?order=createdAt:desc&status=${status}&dateRange=$tanggal&status=$status');

        await saveResponseGet(
            res.requestOptions.path, res.statusMessage, res.data.toString());

        dataAllHistory = ModelHistory.fromJson(res.data);
        loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {}
    } else if (search != null && status != null && tanggal != null) {
      try {
        final res = await _dio.get(
            '/v1/history?order=createdAt:desc&search=$search&status=$status&dateRange=$tanggal');

        await saveResponseGet(
            res.requestOptions.path, res.statusMessage, res.data.toString());

        dataAllHistory = ModelHistory.fromJson(res.data);
        loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    } else if (search == null && status != null && tanggal == null) {
      try {
        final res =
            await _dio.get('/v1/history?order=createdAt:desc&status=$status');

        await saveResponseGet(
            res.requestOptions.path, res.statusMessage, res.data.toString());

        dataAllHistory = ModelHistory.fromJson(res.data);
        loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    } else if (search == null && status != null && tanggal != null) {
      try {
        final res = await _dio.get(
            '/v1/history?order=createdAt:desc&status=$status&dateRange=$tanggal');

        await saveResponseGet(
            res.requestOptions.path, res.statusMessage, res.data.toString());

        dataAllHistory = ModelHistory.fromJson(res.data);
        loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    } else if (search == null && status == null && tanggal != null) {
      try {
        final res = await _dio
            .get('/v1/history?order=createdAt:desc&dateRange=$tanggal');
        print('${res.data['data'].length}');
        dataAllHistory = ModelHistory.fromJson(res.data);
        loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    } else if (search != null && status == null && tanggal != null) {
      try {
        final res = await _dio.get(
            '/v1/history?order=createdAt:desc&search=$search&dateRange=$tanggal');

        await saveResponseGet(
            res.requestOptions.path, res.statusMessage, res.data.toString());

        dataAllHistory = ModelHistory.fromJson(res.data);
        loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  searchByText(context, String? search, String? status, String? tanggal) async {
    if (search != null && status == null && tanggal == null) {
      try {
        final resNFT = await _dio.get('/v1/history/nft?search=$search');
        final resPPOB = await _dio.get('/v1/history/ppob?search=$search');
        final resUMKM =
            await _dio.get('/v1/history/marketplace?search=$search');

        await saveResponseGet(resNFT.requestOptions.path, resNFT.statusMessage,
            resNFT.data.toString());
        await saveResponseGet(resPPOB.requestOptions.path,
            resPPOB.statusMessage, resPPOB.data.toString());
        await saveResponseGet(resUMKM.requestOptions.path,
            resUMKM.statusMessage, resUMKM.data.toString());

        print('a');
        print('${resNFT.data['data'].length}');
        print('${resPPOB.data['data'].length}');
        print('${resUMKM.data['data'].length}');
        if (resNFT.data['data'].length != 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resNFT.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length != 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resPPOB.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length != 0) {
          dataAllHistory = ModelHistory.fromJson(resUMKM.data);
        }
        loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {}
    } else if (search != null && status != null && tanggal == null) {
      try {
        print(tanggal);
        final resNFT = await _dio.get(
            '/v1/history/nft?order=createdAt:desc&status=$status&search=$search');
        final resPPOB = await _dio.get(
            '/v1/history/ppob?order=createdAt:desc&status=$status&search=$search');
        final resUMKM = await _dio.get(
            '/v1/history/marketplace?order=createdAt:desc&status=$status&search=$search');

        await saveResponseGet(resNFT.requestOptions.path, resNFT.statusMessage,
            resNFT.data.toString());
        await saveResponseGet(resPPOB.requestOptions.path,
            resPPOB.statusMessage, resPPOB.data.toString());
        await saveResponseGet(resUMKM.requestOptions.path,
            resUMKM.statusMessage, resUMKM.data.toString());

        print('a');
        print('${resNFT.data['data'].length}');
        print('${resPPOB.data['data'].length}');
        print('${resUMKM.data['data'].length}');
        if (resNFT.data['data'].length != 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resNFT.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length != 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resPPOB.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length != 0) {
          dataAllHistory = ModelHistory.fromJson(resUMKM.data);
        }
        loadingHistory = false;
        notifyListeners();

        // final res = await _dio.get(
        //     '/v1/history?order=createdAt:desc&status=${status}&dateRange=$tanggal&status=$status');
        // print('${res.data['data'].length}');
        // dataAllHistory = ModelHistory.fromJson(res.data);
        // loadingHistory = false;
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {}
    } else if (search != null && status != null && tanggal != null) {
      try {
        var now = DateTime.now();
        String nowSplit = now.toString().substring(0, 10);

        DateTime pastMonth = DateTime(
            DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);

        tanggal = '${pastMonth.toString().substring(0, 10)}:${nowSplit}';
        print(tanggal);
        final resNFT = await _dio.get(
            '/v1/history/nft?order=createdAt:desc&status=$status&dateRange=$tanggal&search=$search');
        final resPPOB = await _dio.get(
            '/v1/history/ppob?order=createdAt:desc&status=$status&dateRange=$tanggal&search=$search');
        final resUMKM = await _dio.get(
            '/v1/history/marketplace?order=createdAt:desc&status=$status&dateRange=$tanggal&search=$search');

        await saveResponseGet(resNFT.requestOptions.path, resNFT.statusMessage,
            resNFT.data.toString());
        await saveResponseGet(resPPOB.requestOptions.path,
            resPPOB.statusMessage, resPPOB.data.toString());
        await saveResponseGet(resUMKM.requestOptions.path,
            resUMKM.statusMessage, resUMKM.data.toString());

        print('a');
        print('${resNFT.data['data'].length}');
        print('${resPPOB.data['data'].length}');
        print('${resUMKM.data['data'].length}');
        if (resNFT.data['data'].length != 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resNFT.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length != 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resPPOB.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length != 0) {
          dataAllHistory = ModelHistory.fromJson(resUMKM.data);
        }
        loadingHistory = false;
        notifyListeners();
        // final res = await _dio.get(
        //     '/v1/history?order=createdAt:desc&search=$search&status=$status&dateRange=$tanggal');
        // print('${res.data['data'].length}');
        // dataAllHistory = ModelHistory.fromJson(res.data);
        // loadingHistory = false;
        // notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    } else if (search == null && status != null && tanggal == null) {
      try {
        final resNFT = await _dio
            .get('/v1/history/nft?order=createdAt:desc&status=$status');
        final resPPOB = await _dio
            .get('/v1/history/ppob?order=createdAt:desc&status=$status');
        final resUMKM = await _dio
            .get('/v1/history/marketplace?order=createdAt:desc&status=$status');
        print('a');
        print('${resNFT.data['data'].length}');
        print('${resPPOB.data['data'].length}');
        print('${resUMKM.data['data'].length}');
        if (resNFT.data['data'].length != 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resNFT.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length != 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resPPOB.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length != 0) {
          dataAllHistory = ModelHistory.fromJson(resUMKM.data);
        }
        // final res =
        //     await _dio.get('/v1/history?order=createdAt:desc&status=$status');
        // print('${res.data['data'].length}');
        // dataAllHistory = ModelHistory.fromJson(res.data);
        // loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    } else if (search == null && status != null && tanggal != null) {
      var now = DateTime.now();
      String nowSplit = now.toString().substring(0, 10);

      DateTime pastMonth = DateTime(
          DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);

      tanggal = '${pastMonth.toString().substring(0, 10)}:${nowSplit}';
      print(tanggal);
      try {
        final resNFT = await _dio.get(
            '/v1/history/nft?order=createdAt:desc&status=$status&dateRange=$tanggal');
        final resPPOB = await _dio.get(
            '/v1/history/ppob?order=createdAt:desc&status=$status&dateRange=$tanggal');
        final resUMKM = await _dio.get(
            '/v1/history/marketplace?order=createdAt:desc&status=$status&dateRange=$tanggal');

        await saveResponseGet(resNFT.requestOptions.path, resNFT.statusMessage,
            resNFT.data.toString());
        await saveResponseGet(resPPOB.requestOptions.path,
            resPPOB.statusMessage, resPPOB.data.toString());
        await saveResponseGet(resUMKM.requestOptions.path,
            resUMKM.statusMessage, resUMKM.data.toString());

        print('a');
        print('${resNFT.data['data'].length}');
        print('${resPPOB.data['data'].length}');
        print('${resUMKM.data['data'].length}');
        if (resNFT.data['data'].length != 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resNFT.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length != 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resPPOB.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length != 0) {
          dataAllHistory = ModelHistory.fromJson(resUMKM.data);
        }
        // final res = await _dio.get(
        //     '/v1/history?order=createdAt:desc&status=$status&dateRange=$tanggal');
        // print('${res.data['data'].length}');
        // dataAllHistory = ModelHistory.fromJson(res.data);
        // loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    } else if (search == null && status == null && tanggal != null) {
      try {
        final resNFT = await _dio
            .get('/v1/history/nft?order=createdAt:desc&dateRange=$tanggal');
        final resPPOB = await _dio
            .get('/v1/history/ppob?order=createdAt:desc&dateRange=$tanggal');
        final resUMKM = await _dio.get(
            '/v1/history/marketplace?order=createdAt:desc&dateRange=$tanggal');

        await saveResponseGet(resNFT.requestOptions.path, resNFT.statusMessage,
            resNFT.data.toString());
        await saveResponseGet(resPPOB.requestOptions.path,
            resPPOB.statusMessage, resPPOB.data.toString());
        await saveResponseGet(resUMKM.requestOptions.path,
            resUMKM.statusMessage, resUMKM.data.toString());

        print('a');
        print('${resNFT.data['data'].length}');
        print('${resPPOB.data['data'].length}');
        print('${resUMKM.data['data'].length}');
        if (resNFT.data['data'].length != 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resNFT.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length != 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resPPOB.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length != 0) {
          dataAllHistory = ModelHistory.fromJson(resUMKM.data);
        }
        // final res = await _dio
        //     .get('/v1/history?order=createdAt:desc&dateRange=$tanggal');
        // print('${res.data['data'].length}');
        // dataAllHistory = ModelHistory.fromJson(res.data);
        // loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    } else if (search != null && status == null && tanggal != null) {
      try {
        var now = DateTime.now();
        String nowSplit = now.toString().substring(0, 10);

        DateTime pastMonth = DateTime(
            DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);

        tanggal = '${pastMonth.toString().substring(0, 10)}:${nowSplit}';
        print(tanggal);
        final resNFT = await _dio.get(
            '/v1/history/nft?order=createdAt:desc&search=$search&dateRange=$tanggal');
        final resPPOB = await _dio.get(
            '/v1/history/ppob?order=createdAt:desc&search=$search&dateRange=$tanggal');
        final resUMKM = await _dio.get(
            '/v1/history/marketplace?order=createdAt:desc&search=$search&dateRange=$tanggal');

        await saveResponseGet(resNFT.requestOptions.path, resNFT.statusMessage,
            resNFT.data.toString());
        await saveResponseGet(resPPOB.requestOptions.path,
            resPPOB.statusMessage, resPPOB.data.toString());
        await saveResponseGet(resUMKM.requestOptions.path,
            resUMKM.statusMessage, resUMKM.data.toString());

        print('a');
        print('${resNFT.data['data'].length}');
        print('${resPPOB.data['data'].length}');
        print('${resUMKM.data['data'].length}');
        if (resNFT.data['data'].length != 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resNFT.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length != 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resPPOB.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length != 0) {
          dataAllHistory = ModelHistory.fromJson(resUMKM.data);
        }
        // final res = await _dio.get(
        //     '/v1/history?order=createdAt:desc&search=$search&dateRange=$tanggal');
        // print('${res.data['data'].length}');
        // dataAllHistory = ModelHistory.fromJson(res.data);
        // loadingHistory = false;
        notifyListeners();
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  searchAllA(context, String? search, String? status, String? tanggal) async {
    if (search != 'All') {
      try {
        print(tanggal);
        final resNFT = await _dio
            .get('/v1/history/nft?order=createdAt:desc&search=$search');
        final resPPOB = await _dio
            .get('/v1/history/ppob?order=createdAt:desc&search=$search');
        final resUMKM = await _dio
            .get('/v1/history/marketplace?order=createdAt:desc&search=$search');
        print('a');
        print('${resNFT.data['data'].length}');
        print('${resPPOB.data['data'].length}');
        print('${resUMKM.data['data'].length}');
        if (resNFT.data['data'].length != 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resNFT.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length != 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resPPOB.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length != 0) {
          dataAllHistory = ModelHistory.fromJson(resUMKM.data);
        }
        loadingHistory = false;
        notifyListeners();

        // final res = await _dio.get(
        //     '/v1/history?order=createdAt:desc&status=${status}&dateRange=$tanggal&status=$status');
        // print('${res.data['data'].length}');
        // dataAllHistory = ModelHistory.fromJson(res.data);
        // loadingHistory = false;
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {}
    } else {
      try {
        var now = DateTime.now();
        String nowSplit = now.toString().substring(0, 10);

        DateTime pastMonth = DateTime(
            DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);

        tanggal = '${pastMonth.toString().substring(0, 10)}:${nowSplit}';
        print(tanggal);
        print(tanggal);
        final resNFT = await _dio.get(
            '/v1/history/nft?order=createdAt:desc&search=$search&dateRange=$tanggal');
        final resPPOB = await _dio.get(
            '/v1/history/ppob?order=createdAt:desc&search=$search&dateRange=$tanggal');
        final resUMKM = await _dio.get(
            '/v1/history/marketplace?order=createdAt:desc&search=$search&dateRange=$tanggal');

        await saveResponseGet(resNFT.requestOptions.path, resNFT.statusMessage,
            resNFT.data.toString());
        await saveResponseGet(resPPOB.requestOptions.path,
            resPPOB.statusMessage, resPPOB.data.toString());
        await saveResponseGet(resUMKM.requestOptions.path,
            resUMKM.statusMessage, resUMKM.data.toString());

        print('a');
        print('${resNFT.data['data'].length}');
        print('${resPPOB.data['data'].length}');
        print('${resUMKM.data['data'].length}');
        if (resNFT.data['data'].length != 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resNFT.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length != 0 &&
            resUMKM.data['data'].length == 0) {
          dataAllHistory = ModelHistory.fromJson(resPPOB.data);
        } else if (resNFT.data['data'].length == 0 &&
            resPPOB.data['data'].length == 0 &&
            resUMKM.data['data'].length != 0) {
          dataAllHistory = ModelHistory.fromJson(resUMKM.data);
        }
        loadingHistory = false;
        notifyListeners();

        // final res = await _dio.get(
        //     '/v1/history?order=createdAt:desc&status=${status}&dateRange=$tanggal&status=$status');
        // print('${res.data['data'].length}');
        // dataAllHistory = ModelHistory.fromJson(res.data);
        // loadingHistory = false;
      } on DioError catch (e) {
        try {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        } catch (e) {
          final msg = e.toString();
          print(msg);
          await customSnackbar(
              type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        }
      } catch (e) {}
    }
  }

  // getSelectDropdown(
  //     context, String? status, String? produk, String? transaksi) async {
  //   if (status != null && produk == null && transaksi == null) {
  //     try {
  //       final res = await _dio.get('/v1/history?status=$status');
  //       print('${res.data['data'].length}');
  //       dataAllHistory = ModelHistory.fromJson(res.data);
  //       loadingHistory = false;
  //       notifyListeners();
  //     } on DioError catch (e) {
  //       try {
  //         ErrorModel data = ErrorModel.fromJson(e.response!.data);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: data.error.toString());
  //       } catch (e) {
  //         final msg = e.toString();
  //         print(msg);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: 'Terjadi kesalahan!');
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else if (status != null && produk != null && transaksi == null) {
  //     try {
  //       final res =
  //           await _dio.get('/v1/history?search=${produk}&status=${status}');
  //       print('${res.data['data'].length}');
  //       dataAllHistory = ModelHistory.fromJson(res.data);
  //       loadingHistory = false;
  //       notifyListeners();
  //     } on DioError catch (e) {
  //       try {
  //         ErrorModel data = ErrorModel.fromJson(e.response!.data);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: data.error.toString());
  //       } catch (e) {
  //         final msg = e.toString();
  //         print(msg);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: 'Terjadi kesalahan!');
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else if (status != null && produk != null && transaksi != null) {
  //     try {
  //       final res = await _dio.get(
  //           '/v1/history?search=${produk}&order=${transaksi}&status=${status}');
  //       print('${res.data['data'].length}');
  //       dataAllHistory = ModelHistory.fromJson(res.data);
  //       loadingHistory = false;
  //       notifyListeners();
  //     } on DioError catch (e) {
  //       try {
  //         ErrorModel data = ErrorModel.fromJson(e.response!.data);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: data.error.toString());
  //       } catch (e) {
  //         final msg = e.toString();
  //         print(msg);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: 'Terjadi kesalahan!');
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else if (status != null && produk == null && transaksi != null) {
  //     try {
  //       final res =
  //           await _dio.get('/v1/history?search=${produk}&status=${status}');
  //       print('${res.data['data'].length}');
  //       dataAllHistory = ModelHistory.fromJson(res.data);
  //       loadingHistory = false;
  //       notifyListeners();
  //     } on DioError catch (e) {
  //       try {
  //         ErrorModel data = ErrorModel.fromJson(e.response!.data);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: data.error.toString());
  //       } catch (e) {
  //         final msg = e.toString();
  //         print(msg);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: 'Terjadi kesalahan!');
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else if (status == null && produk != null && transaksi != null) {
  //     try {
  //       final res =
  //           await _dio.get('/v1/history?search=${produk}&order=${transaksi}');
  //       print('${res.data['data'].length}');
  //       dataAllHistory = ModelHistory.fromJson(res.data);
  //       loadingHistory = false;
  //       notifyListeners();
  //     } on DioError catch (e) {
  //       try {
  //         ErrorModel data = ErrorModel.fromJson(e.response!.data);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: data.error.toString());
  //       } catch (e) {
  //         final msg = e.toString();
  //         print(msg);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: 'Terjadi kesalahan!');
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else if (status != null && produk == null && transaksi != null) {
  //     try {
  //       final res =
  //           await _dio.get('/v1/history?status=${status}&order=${transaksi}');
  //       print('${res.data['data'].length}');
  //       dataAllHistory = ModelHistory.fromJson(res.data);
  //       loadingHistory = false;
  //       notifyListeners();
  //     } on DioError catch (e) {
  //       try {
  //         ErrorModel data = ErrorModel.fromJson(e.response!.data);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: data.error.toString());
  //       } catch (e) {
  //         final msg = e.toString();
  //         print(msg);
  //         await customSnackbar(
  //             type: 'error', title: 'error', text: 'Terjadi kesalahan!');
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }
}
