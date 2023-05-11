import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dialogsProvider = Provider<CustomDialogs>((ref) {
  return CustomDialogs(ref);
});

class CustomDialogs {
  CustomDialogs(this.ref);

  final Ref ref;

  Future<void> showLoadingDialog(BuildContext context, String? message) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(height: 10),
            if (message != null)
              Text(message, style: const TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  void removeDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
