import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kmp_togo_mobile/pages/notification/notification_detail_page.dart';

import 'notification_widget/card_notification.dart';

class notificationPage extends StatelessWidget {
  const notificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationDetailPage())),
              child: cardNotification(
                title: 'notification',
                subtitle: 'pada tanggal saekian ada dana masuk ke kamu lohh',
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationDetailPage())),
              child: cardNotification(
                title: 'notification',
                subtitle: 'pada tanggal saekian ada dana masuk ke kamu lohh',
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationDetailPage())),
              child: cardNotification(
                title: 'notification',
                subtitle: 'pada tanggal saekian ada dana masuk ke kamu lohh',
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationDetailPage())),
              child: cardNotification(
                title: 'notification',
                subtitle: 'pada tanggal saekian ada dana masuk ke kamu lohh',
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationDetailPage())),
              child: cardNotification(
                title: 'notification',
                subtitle: 'pada tanggal saekian ada dana masuk ke kamu lohh',
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationDetailPage())),
              child: cardNotification(
                title: 'notification',
                subtitle: 'pada tanggal saekian ada dana masuk ke kamu lohh',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
