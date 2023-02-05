import 'dart:io';

// import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:kmp_togo_mobile/providers/database/database.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

Future<void> createExcel(Future<List<ResponseFromAPIData>> ff) async {
//Create an Excel document.
  List<ResponseFromAPIData> dataResponse = [];

  dataResponse = await ff.then((value) => value);

  print('panjang: ${dataResponse.length}');
  //Creating a workbook.
  final Workbook workbook = Workbook();
  //Accessing via index
  final Worksheet sheet = workbook.worksheets[0];
  sheet.showGridlines = false;

  // Enable calculation for worksheet.
  sheet.enableSheetCalculations();

  //Set data in the worksheet.

  final Range range6 = sheet.getRangeByName('B15:G15');
  range6.cellStyle.fontSize = 10;
  range6.cellStyle.bold = true;

  sheet.getRangeByIndex(15, 2).setText('METHOD');

  for (int i = 0; i < dataResponse.length; i++) {
    sheet.getRangeByIndex(16 + i, 2).setText(dataResponse[i].method);
  }

  sheet.getRangeByIndex(15, 3).setText('PATH');
  for (int i = 0; i < dataResponse.length; i++) {
    sheet.getRangeByIndex(16 + i, 3).setText(dataResponse[i].path);
  }

  sheet.getRangeByIndex(15, 3, 15, 4).merge();
  sheet.getRangeByIndex(16, 3, 16, 4).merge();
  sheet.getRangeByIndex(17, 3, 17, 4).merge();
  sheet.getRangeByIndex(18, 3, 18, 4).merge();
  sheet.getRangeByIndex(19, 3, 19, 4).merge();
  sheet.getRangeByIndex(20, 3, 20, 4).merge();

  sheet.getRangeByIndex(15, 5).setText('STATUS');
  for (int i = 0; i < dataResponse.length; i++) {
    sheet.getRangeByIndex(16 + i, 5).setText(dataResponse[i].status);
  }

  sheet.getRangeByIndex(15, 6).setText('RESPONSE');
  for (int i = 0; i < dataResponse.length; i++) {
    sheet.getRangeByIndex(16 + i, 6).setText(dataResponse[i].responseBody);
  }

  sheet.getRangeByIndex(15, 7).setText('BODY');
  for (int i = 0; i < dataResponse.length; i++) {
    sheet.getRangeByIndex(16 + i, 7).setText(dataResponse[i].data);
  }

  sheet.getRangeByName('E15:G15').cellStyle.hAlign = HAlignType.right;
  sheet.getRangeByName('B15:G15').cellStyle.fontSize = 10;
  sheet.getRangeByName('B15:G15').cellStyle.bold = true;
  sheet.getRangeByName('B16:G20').cellStyle.fontSize = 9;

  //Save and launch the excel.
  final List<int> bytes = workbook.saveAsStream();
  //Dispose the document.
  workbook.dispose();
  // var filePath = '/storage/emulated/0/Download/Output.xlsx';

  final status = await Permission.storage.status;
  if (status != PermissionStatus.granted) {
    final result = await Permission.storage.request();
    if (result == PermissionStatus.granted) {
      //Save and launch file.
      var dir = await getApplicationDocumentsDirectory();

      String namafile =
          DateTime.now().toIso8601String().replaceAll(RegExp(r'[^\w\s]+'), '');

      print('LEO2: $namafile');
      File('${dir.path}/$namafile.xlsx').writeAsBytes(bytes);

      // File(dir.path).writeAsBytes(bytes);
      //
      OpenFilex.open('${dir.path}/$namafile.xlsx');
    }
  } else {
    //Save and launch file.
    var dir = await getApplicationDocumentsDirectory();

    String namafile =
        DateTime.now().toIso8601String().replaceAll(RegExp(r'[^\w\s]+'), '');

    print('LEO2: $namafile');
    File('${dir.path}/$namafile.xlsx').writeAsBytes(bytes);

    // File(dir.path).writeAsBytes(bytes);
    //
    OpenFilex.open('${dir.path}/$namafile.xlsx');
  }
}
