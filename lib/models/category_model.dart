import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String imageName;
  final String title;
  final Color color;

  const CategoryModel(
      {required this.id,
      required this.imageName,
      required this.color,
      required this.title});
}
