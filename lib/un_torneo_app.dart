import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/external/gql_handler.dart';
import 'package:untorneo_mobile/core/router/router.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';

class UnTorneoApp extends ConsumerStatefulWidget {
  const UnTorneoApp({super.key});

  @override
  ConsumerState<UnTorneoApp> createState() => _UnTorneoAppState();
}

class _UnTorneoAppState extends ConsumerState<UnTorneoApp> {
  @override
  void initState() {
    ref.read(graphQLProvider).connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routerProv = ref.read(routerProvider);
    return MaterialApp.router(
      title: 'OYT - Waiter',
      routerConfig: routerProv,
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider),
    );
  }
}
