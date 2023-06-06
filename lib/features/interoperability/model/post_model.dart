import 'dart:convert';
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      postId: map['postId'],
      ownerId: map['ownerId'],
      location: map['location'],
      description: map['description'],
    );
  }

  const Post({
    required this.postId,
    required this.ownerId,
    required this.location,
    required this.description,
  });

  final String postId;
  final String ownerId;
  final String location;
  final String description;

  @override
  List<Object?> get props {
    return [
      postId,
      ownerId,
      location,
      description
    ];
  }
}