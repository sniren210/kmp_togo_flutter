import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/cardtopup.dart';
import 'package:kmp_togo_mobile/providers/account/provider_account.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_membertype.dart';

class iuranPokok extends StatefulWidget {
  final String name;

  const iuranPokok({super.key, required this.name});

  @override
  State<iuranPokok> createState() => _iuranPokokState();
}

class _iuranPokokState extends State<iuranPokok> {
  late ScrollController _scrollController;

  Color colorAppBar = Colors.transparent;

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  int selectedIndex = 0;
  double expandHeight = 340;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          colorAppBar = _isSliverAppBarExpanded
              ? Theme.of(context).canvasColor
              : Colors.transparent;
          expandHeight = _isSliverAppBarExpanded ? 90 : 340;
        });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'ID', symbol: 'Rp.');

    return BaseWidget<ProviderMemberType>(
        model: ProviderMemberType(Repository()),
        onModelReady: (model) => model.fetchAllMemberType(),
        child: Container(),
        builder: (context, model, child) {
          final role = model.items?.data
              .firstWhere((element) => element.name == widget.name);

          return SafeArea(
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              appBar: AppBar(
                toolbarHeight: 160,
                backgroundColor: Theme.of(context).primaryColor,
                automaticallyImplyLeading: false,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Iuran pokok & wajib',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    const CircleAvatar(
                      radius: 37,
                      backgroundImage: AssetImage('assets/images/logon.jpg'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Builder(builder: (context) {
                      int jumlah = (role?.monthlyPrincipalFee ?? 0) +
                          ((role?.monthlyMandatoryFee ?? 0) * 12);
                      return Text(
                          'total : ${currencyFormatter.format(jumlah)}');
                    }),
                  ],
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                controller: _scrollController,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const AlwaysScrollableScrollPhysics(
                  parent: ClampingScrollPhysics(),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                      ),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                title: Text(currencyFormatter
                                    .format(role?.monthlyPrincipalFee ?? 0)),
                                subtitle: Text('Iuran pokok'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                      ),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                title: Text(currencyFormatter
                                    .format(role?.monthlyMandatoryFee ?? 0)),
                                subtitle: Text('Iuran wajib'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  card1(String judul, int _selectedIndex) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = _selectedIndex;
        });
      },
      child: Container(
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: selectedIndex == _selectedIndex
                ? const Color(0xFF85014e)
                : Colors.grey.shade300),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                judul,
                style: TextStyle(
                  color: selectedIndex == _selectedIndex
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
