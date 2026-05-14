import 'package:flutter/material.dart';

class CategorySection {
  final String title;
  final String content;

  CategorySection({
    required this.title,
    required this.content,
  });
}

class CategoryModel {
  final String id;
  final String name;
  final IconData icon;
  final String imageUrl;
  final String description;
  final List<CategorySection> contentSections;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.imageUrl = '',
    this.description = '',
    this.contentSections = const [],
  });
}
