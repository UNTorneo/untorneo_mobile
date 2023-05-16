import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:untorneo_mobile/core/constants/lotti_assets.dart';
import 'package:untorneo_mobile/widgets/background/animated_background.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    this.error = 'Ha ocurrido un error',
    super.key,
  });

  final String error;
  static const route = '/error';

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      child: Column(
        children: [
          if (Navigator.of(context).canPop()) const BackButton(),
          const Spacer(),
          Lottie.asset(
            LottieAssets.error,
            repeat: false,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 15),
          Text(
            '¡Oops!',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            error,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
          ),
          if (GoRouter.of(context).canPop()) ...[
            const SizedBox(height: 20),
            FilledButton(
              onPressed: GoRouter.of(context).pop,
              child: const Text('Volver'),
            ),
          ],
          const Spacer(),
        ],
      ),
    );
  }
}
