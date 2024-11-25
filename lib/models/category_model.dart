import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String imageName;
  String title;
  Color color;

  CategoryModel({
    required this.id,
    required this.imageName,
    required this.color,
    required this.title
  });
}