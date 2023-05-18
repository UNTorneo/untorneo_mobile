import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchesDetailScreen extends ConsumerStatefulWidget {
  const MatchesDetailScreen({required this.id, super.key});

  static const route = '/matches';
  static const routeParams = '/matches/:id';
  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MatchesDetailScreenState();
}

class _MatchesDetailScreenState extends ConsumerState<MatchesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches Detail'),
      ),
      body: Center(
        child: Text('Matches Detail Screen'),
      ),
    );
  }
}
