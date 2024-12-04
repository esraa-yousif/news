import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/category_grid.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/models/category_model.dart';
import 'package:news/categories/category_details.dart';
import 'package:news/search_screen.dart';
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
  bool isSearchTrigerd = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            selectsdCategory != null
                ? IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen(
                                  categoryId: selectsdCategory!.title,
                                )),
                      );
                    },
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 18),
                      child: Icon(Icons.search, size: 30,),
                    ))
                : const SizedBox()
          ],
          title: isSearchTrigerd
              ? const SizedBox()
              : Text(
                  selectsdCategory != null
                      ? selectsdCategory!.title
                      : selectedDrawerItem == DrawerItem.categories
                          ? 'News App'
                          : 'Settings',
                ),
        ),
        drawer: HomeDrawer(
          onDrawerItemSelected: onDrawerItemSelected,
        ),
        body: selectsdCategory != null
            ? CategoryDetails(selectsdCategory!.id)
            : selectedDrawerItem == DrawerItem.categories
                ? CategoryGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : const SettingsTab(),
      ),
    );
  }

  void onDrawerItemSelected(DrawerItem item) {
    selectedDrawerItem = item;
    selectsdCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectsdCategory = category;
    setState(() {});
  }
}
