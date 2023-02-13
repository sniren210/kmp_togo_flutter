import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kmp_togo_mobile/pages/common/cardtopup.dart';

class iuranPokok extends StatefulWidget {
  const iuranPokok({super.key});

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
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('X'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        appBar: AppBar(
          toolbarHeight: 140,
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Iuran pokok & wajib',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const CircleAvatar(
                radius: 37,
                backgroundImage: AssetImage('assets/images/logon.jpg'),
              ),
              Text('total: Rp.99999'),
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                      // for (int i = 0;
                      //     i < (v.dataHistorySaldo?.data?.length ?? 0);
                      //     i++)
                      Card(
                        child: ListTile(
                          title: Text('Rp. 50.000'),
                          subtitle: Text('iuran pokok'),
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
                      // for (int i = 0;
                      //     i < (v.dataHistorySaldo?.data?.length ?? 0);
                      //     i++)
                      Card(
                        child: ListTile(
                          title: Text('Rp. 100.000'),
                          subtitle: Text('iuran wajib'),
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
