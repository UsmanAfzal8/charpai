import 'package:flutter/material.dart';

import '../../widgets/custom_widgets/custom_widget.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ForText(
          name: 'Empty Screen',
          bold: true,
          size: 26,
        ),
      ),
    );
  }
}
