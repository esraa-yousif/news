import 'package:flutter/material.dart';
import 'package:news/categories/category_grid.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/models/category_model.dart';
import 'package:news/news/news_tab.dart';
import 'package:news/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectsdCategory;


  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectsdCategory != null ? selectsdCategory!.title 
        : selectedDrawerItem == DrawerItem.categories ? 'News App' 
        : 'Settings',),
      ),
      drawer: HomeDrawer(onDrawerItemSelected: onDrawerItemSelected,),
      body: selectsdCategory != null ? NewsTab(selectsdCategory!.id)
       : selectedDrawerItem == DrawerItem.categories 
       ? CategoryGrid(onCategorySelected: onCategorySelected,) 
       : const SettingsTab(),
    );
  }

  void onDrawerItemSelected (DrawerItem item){
  selectedDrawerItem = item;
  selectsdCategory = null;
  setState(() {});
  Navigator.of(context).pop();
  }

  void onCategorySelected (CategoryModel category){
    selectsdCategory = category;
    setState(() {});
  }
}