import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CardItem extends Equatable {
  const CardItem({required this.title, required this.icon, required this.tab});

  final String title;
  final IconData icon;
  final Widget Function() tab;

  @override
  List<Object> get props => [title, icon, tab];
}
