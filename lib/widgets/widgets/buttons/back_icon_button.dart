import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: GoRouter.of(context).pop, icon: const Icon(Icons.arrow_back))
      ],
    );
  }
}
