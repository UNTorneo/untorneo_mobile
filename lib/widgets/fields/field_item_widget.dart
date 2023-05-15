import 'package:flutter/material.dart';

class FieldItemWidget extends StatelessWidget {
  const FieldItemWidget({super.key, required this.title, required this.value});

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        style: theme.bodyLarge?.copyWith(color: Colors.black),
        children: [
          TextSpan(text: '$title: '),
          TextSpan(
            text: value ?? 'No definido.',
            style: theme.titleMedium,
          ),
        ],
      ),
    );
  }
}
