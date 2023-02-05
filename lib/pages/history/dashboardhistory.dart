import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/pages/history/history.dart';
import 'package:sizer/sizer.dart';

class HistoryDashboard extends StatefulWidget {
  HistoryDashboard({Key? key}) : super(key: key);

  @override
  State<HistoryDashboard> createState() => _HistoryDashboardState();
}

class _HistoryDashboardState extends State<HistoryDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          // itemCount: itemCard?.length,
          // itemBuilder: (BuildContext ctx, index) {
          //   return CardHistory(
          //     icon: itemCard?[index][''],
          //   )
          // }
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => History(
                            search: 'b',
                          )),
                );
              },
              child: CardHistory(
                icon: Icons.shopping_basket,
                nama: 'Belanja',
              ),
            ),
            InkWell(
              onTap: () {},
              child: CardHistory(
                icon: Icons.monetization_on,
                nama: 'NFT',
              ),
            ),
            InkWell(
              onTap: () {},
              child: CardHistory(
                icon: Icons.electric_bolt,
                nama: 'PPOB',
              ),
            ),
            InkWell(
              onTap: () {},
              child: CardHistory(
                icon: Icons.money,
                nama: 'Withdraw',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardHistory extends StatelessWidget {
  IconData? icon;
  String? nama;
  CardHistory({Key? key, this.icon, this.nama});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xFF85014e),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 4.5.h,
          ),
          Container(
            margin: EdgeInsets.only(top: 3.h),
            child: Text(
              nama ?? "",
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
          ),
        ],
      ),
    );
  }
}
