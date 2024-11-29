import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoryGrid extends StatelessWidget {
   CategoryGrid({super.key, required this.onCategorySelected});

  void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final categories = List.generate(
        6,
        (index) => CategoryModel(
            id: '$index',
            imageName: 'ball.png',
            color: AppTheme.red,
            title: 'Sports'));

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
                  onTap: (){
                    onCategorySelected(categories[index]);
                  },
                  child: CategoryItem(
                    categoryModel: categories[index],
                   index:index,),
                )),
          )
        ],
      ),
    );
  }
}
