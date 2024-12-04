import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.index, required this.categoryModel});

  final CategoryModel categoryModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: const Radius.circular(25),
            topStart: const Radius.circular(25),
            bottomEnd: Radius.circular(index.isEven ? 25 : 0),
            bottomStart: Radius.circular(index.isOdd ? 25 : 0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/${categoryModel.imageName}'),
          ),
          Text(categoryModel.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
