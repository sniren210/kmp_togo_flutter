import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class PenyertaanModal extends StatefulWidget {
  const PenyertaanModal({super.key});

  @override
  State<PenyertaanModal> createState() => _PenyertaanModalState();
}

class _PenyertaanModalState extends State<PenyertaanModal> {
  TextEditingController nominal = TextEditingController();
  bool saldokosong = false;
  String? status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penyertaan Modal'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 2.h),
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: const Color(0xFF85014e))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 3.w),
                          child: Text(
                            "Nominal",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 138, 111, 111),
                                fontSize: 9.sp),
                          )),
                      Container(
                        margin: EdgeInsets.only(
                          left: 3.w,
                        ),
                        child: TextFormField(
                          controller: nominal,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              prefixIconConstraints:
                                  BoxConstraints(minWidth: 3.w),
                              prefixIcon: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Price',
                                    style: TextStyle(fontSize: 11.sp),
                                  )
                                ],
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 20),
                              suffixIcon: Icon(
                                Icons.monetization_on,
                                size: 7.w,
                              )),
                        ),
                      ),
                      saldokosong == false
                          ? Container()
                          : Container(
                              margin: EdgeInsets.only(
                                left: 3.w,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 3.w),
                                      child: Text(
                                        "Saldo tidak boleh kosong!",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 138, 111, 111),
                                            fontSize: 9.sp),
                                      )),
                                ],
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownSearch<String>(
                  popupProps: PopupProps.dialog(
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: ["3 Bulan", "6 Bulan", "12 Bulan"],
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Select Status",
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      status = value;
                    });
                    print('haloo  ${status}');
                    // getSelectDropdown(status, tanggal);
                  },
                  // selectedItem: "done",
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // checkSaldo(nominal.text);
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 4.h),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFF85014e)),
                  child: const Text(
                    'Lanjutkan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
