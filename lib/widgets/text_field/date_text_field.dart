import 'package:flutter/material.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class DateTextField extends StatelessWidget {
  DateTextField({
    super.key,
    required this.label,
    required this.onTap,
  });

  final controller = TextEditingController();
  final String label;
  final void Function(DateTime time) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final res = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1922, 12),
          lastDate: DateTime.now(),
        );
        if (res == null) return;
        onTap(res);
        controller.text = '${res.day}/${res.month}/${res.year}';
      },
      child: AbsorbPointer(
        child: CustomTextField(label: label, controller: controller),
      ),
    );
  }
}
