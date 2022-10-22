import 'package:flutter/material.dart';

import '../../widgets/custom_widgets/custom_widget.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            ForText(
              name: 'Your Cart is Empty',
              bold: true,
            ),
          ],
        ),
      ),
    );
  }
}
