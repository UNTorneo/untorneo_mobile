import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untorneo_mobile/core/constants/lotti_assets.dart';

class ScreenLoadingWidget extends StatelessWidget {
  const ScreenLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(LottieAssets.loading, width: 200, height: 200),
        const SizedBox(width: double.infinity, height: 20),
        const Text(
          'Cargando...',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ScreenLoadingWidget());
  }
}
