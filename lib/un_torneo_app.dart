import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/router/router.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';

class UnTorneoApp extends ConsumerWidget {
  const UnTorneoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerProv = ref.read(routerProvider);
    return MaterialApp.router(
      title: 'OYT - Waiter',
      routerConfig: routerProv.goRouter,
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider),
    );
  }
}
