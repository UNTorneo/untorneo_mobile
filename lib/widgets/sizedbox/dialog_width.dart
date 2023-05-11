import 'package:flutter/material.dart';

class DialogWidth extends StatelessWidget {
  const DialogWidth({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(width: size.width * 0.7);
  }
}
