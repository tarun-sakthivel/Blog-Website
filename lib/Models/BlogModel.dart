import 'package:cloud_firestore/cloud_firestore.dart';

class BlogModel {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final DateTime createdAt;

  BlogModel({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.createdAt,
  });


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }

  factory BlogModel.fromMap(String id, Map<String, dynamic> map) {
    return BlogModel(
      id: id,
      title: map['Heading'] ?? '',
      content: map['Content'] ?? '',
      imageUrl: map['ImageUrl'] ?? '',
      createdAt: (map['Time'] as Timestamp).toDate(),
    );
  }
}
