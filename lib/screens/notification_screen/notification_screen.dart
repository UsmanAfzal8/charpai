import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = '/NotificationScreen';
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationScreen'),
      ),
    );
  }
}
