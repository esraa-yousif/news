import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key, required this.onCategorySelected});

  final void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final categories = [
      const CategoryModel(
          id: 'sports',
          imageName: 'ball.png',
          color: AppTheme.red,
          title: 'Sports'),
      const CategoryModel(
          id: 'general',
          imageName: 'Politics.png',
          color: Color(0xFF003E90),
          title: 'Politics'),
      const CategoryModel(
          id: 'health',
          imageName: 'health.png',
          color: Color( 0xFFED1E79),
          title: 'Health'),
      const CategoryModel(
          id: 'business',
          imageName: 'bussines.png',
          color: Color(0xFFCF7E48 ),
          title: 'Besiness'),
      const CategoryModel(
          id: 'entertainment',
          imageName: 'environment.png',
          color: Color( 0xFF4882CF),
          title: 'Entertainment'),
      const CategoryModel(
          id: 'science',
          imageName: 'science.png',
          color: Color( 0xFFF2D352),
          title: 'Science'),
    ];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Pick your category of interest',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.navy,
                    ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                ),
                itemCount: categories.length,
                itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        onCategorySelected(categories[index]);
                      },
                      child: CategoryItem(
                        categoryModel: categories[index],
                        index: index,
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
