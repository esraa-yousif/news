import 'package:flutter/material.dart';
import 'package:news/categories/category_grid.dart';
import 'package:news/categories/drawer_home.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      drawer: HomeDrawer(),
      body: CategoryGrid(),
    );
  }
}