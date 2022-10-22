import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  static const String routeName = '/PaymentScreen';
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentScreen'),
      ),
    );
  }
}
