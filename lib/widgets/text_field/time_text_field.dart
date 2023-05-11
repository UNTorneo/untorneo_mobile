import 'package:flutter/material.dart';
import 'package:untorneo_mobile/core/extensions/date_of_time_extension.dart';
import 'package:untorneo_mobile/widgets/widgets/custom_text_field.dart';

class TimeTextField extends StatefulWidget {
  const TimeTextField({
    Key? key,
    required this.label,
    required this.onTap,
    this.initialTime,
  }) : super(key: key);

  final String label;
  final void Function(TimeOfDay time) onTap;
  final TimeOfDay? initialTime;

  @override
  State<TimeTextField> createState() => _TimeTextFieldState();
}

class _TimeTextFieldState extends State<TimeTextField> {
  final controller = TextEditingController();

  @override
  void initState() {
    if (widget.initialTime != null) {
      controller.text = widget.initialTime!.formated;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final res = await showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 8, minute: 0),
        );
        if (res == null) return;
        widget.onTap(res);
        controller.text = res.formated;
      },
      child: AbsorbPointer(
        child: CustomTextField(label: widget.label, controller: controller),
      ),
    );
  }
}
