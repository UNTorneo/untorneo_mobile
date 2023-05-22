import 'package:equatable/equatable.dart';

class SportModel extends Equatable {
  const SportModel({
    required this.id,
    required this.name,
    required this.description,
    this.modes,
    this.imgs,
    this.logo,
    this.recommendation,
  });

  factory SportModel.fromJson(Map<String, dynamic> map) {
    return SportModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      modes: map['modes'] != null ? List<String>.from(map['modes']) : null,
      imgs: map['imgs'] != null ? List<String>.from(map['imgs']) : null,
      logo: map['logo'] != null ? map['logo'] as String : null,
      recommendation: map['recommendation'] != null
          ? (List<String>.from((map['recommendation'])))
          : null,
    );
  }

  final String id;
  final String name;
  final String description;
  final List<String>? modes;
  final List<String>? imgs;
  final String? logo;
  final List<String>? recommendation;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      modes,
      imgs,
      logo,
      recommendation,
    ];
  }
}
