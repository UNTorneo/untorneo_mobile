import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title, this.subtitle}) : super(key: key);

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        Text('$title:', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 14),
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 14),
        ]
      ],
    );
  }
}
