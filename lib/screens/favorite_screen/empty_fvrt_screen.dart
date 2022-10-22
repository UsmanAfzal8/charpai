import 'package:flutter/material.dart';

class EmptyFvrtScreen extends StatelessWidget {
  const EmptyFvrtScreen({super.key});
  static const String routeName = '/EmptyFvrtScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmptyFvrtScreen'),
      ),
    );
  }
}
