import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';

class TournamentHome extends ConsumerStatefulWidget {
  const TournamentHome({super.key});

  static const route = '/tournaments';

  @override
  createState() => _TournamentHomeState();
}

class _TournamentHomeState extends ConsumerState<TournamentHome> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: ref.read(themeProvider.notifier).roundedBoxDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NOMBRE DEL TORNEO',
                style: theme.titleMedium,
              ),
              const Divider(),
              RichText(
                text: TextSpan(
                  style: theme.bodyLarge,
                  children: [
                    const TextSpan(text: 'Estado: '),
                    TextSpan(text: 'Abierto', style: theme.titleMedium),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: theme.bodyLarge,
                  children: [
                    const TextSpan(text: 'Sede: '),
                    TextSpan(text: 'NOMBRE DE SEDE', style: theme.titleMedium),
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
        ),
      ],
    );
  }
}
