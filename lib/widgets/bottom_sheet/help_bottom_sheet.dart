import 'package:flutter/material.dart';
import 'package:untorneo_mobile/widgets/bottom_sheet/base_bottom_sheet.dart';
import 'package:untorneo_mobile/widgets/bottom_sheet/bottom_sheet_constants.dart';

class HelpBottomSheet extends StatelessWidget {
  const HelpBottomSheet({super.key, required this.text, required this.title});
  final String text;
  final String title;

  static Future<void> show(BuildContext context, String text, String title) {
    return showModalBottomSheet(
      context: context,
      shape: BottomSheetConstants.shape,
      builder: (context) => HelpBottomSheet(text: text, title: title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      title: title,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Text(text, textAlign: TextAlign.start),
          SizedBox(height: 30 + MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
