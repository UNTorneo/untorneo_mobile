import 'package:flutter/material.dart';

class DialogHeader extends StatelessWidget {
  const DialogHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.close),
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
