import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:untorneo_mobile/core/constants/lotti_assets.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';

class MatchesHomeScreen extends ConsumerWidget {
  const MatchesHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: ref.read(themeProvider.notifier).roundedBoxDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('matches.name', style: theme.titleLarge, ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    LottieAssets.waiting,
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  style: theme.bodyLarge,
                  children: [
                    const TextSpan(text: 'Estado: '),
                    TextSpan(
                      text: 'translation',
                      style: theme.titleMedium,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: theme.bodyLarge,
                  children: [
                    const TextSpan(text: 'Sede: '),
                    TextSpan(
                      text: 'No definido',
                      style: theme.titleMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () {},
                child: const Text('Ir al torneo'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
