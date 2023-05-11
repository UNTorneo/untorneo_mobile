import 'package:flutter/material.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';
import 'package:untorneo_mobile/widgets/dialogs/widgets/dialog_header.dart';

class ConfirmActionDialog extends StatelessWidget {
  const ConfirmActionDialog({
    super.key,
    required this.onConfirm,
    this.onCancel,
    required this.title,
    required this.subtitle,
  });

  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String title;
  final String subtitle;

  static Future<void> show({
    required BuildContext context,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    required String title,
    String subtitle = 'Esta acción no se puede deshacer',
  }) {
    return showDialog(
      context: context,
      builder: (context) => ConfirmActionDialog(
        onConfirm: onConfirm,
        onCancel: onCancel,
        title: title,
        subtitle: subtitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: CustomTheme.dialogPadding.copyWith(bottom: 0),
      contentPadding: CustomTheme.dialogPadding.copyWith(top: 0),
      actionsPadding: CustomTheme.dialogPadding,
      title: DialogHeader(title: title),
      actions: [
        TextButton(
          onPressed: onCancel ?? Navigator.of(context).pop,
          child: const Text('Cancelar'),
        ),
        TextButton(onPressed: onConfirm, child: const Text('Confirmar')),
      ],
      content: Text(subtitle, style: const TextStyle(fontSize: 14)),
    );
  }
}
