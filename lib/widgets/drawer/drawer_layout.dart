import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untorneo_mobile/core/theme/theme.dart';

class DrawerLayout extends ConsumerWidget {
  const DrawerLayout({
    super.key,
    required this.drawerChild,
    required this.bodyChild,
    this.drawerWidth = 200,
  });

  final Widget drawerChild;
  final Widget bodyChild;
  final double drawerWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Container(
          decoration: ref.watch(themeProvider.notifier).drawerBoxDecoration,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: drawerWidth,
          height: double.infinity,
          child: drawerChild,
        ),
        Expanded(
          child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: bodyChild,
          ),
        ),
      ],
    );
  }
}
