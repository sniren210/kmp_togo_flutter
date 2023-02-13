import 'package:flutter/material.dart';

class cardNotification extends StatelessWidget {
  const cardNotification({
    super.key, required this.title, required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle:
            Text(subtitle),
        leading: const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/logon.jpg'),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }
}
