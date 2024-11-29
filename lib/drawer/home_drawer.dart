import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onDrawerItemSelected});

  void Function(DrawerItem) onDrawerItemSelected;


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width * 0.8,
      child: Column(
        children: [
          Container(
            color: AppTheme.primary,
            height: screenSize.height * 0.2,
            width: double.infinity,
            child: Center(
              child: Text(
                'News App!',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppTheme.white),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppTheme.white,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => onDrawerItemSelected(DrawerItem.categories),
                      child: Row(
                        children: [
                          const Icon(Icons.menu),
                          const SizedBox(
                            width: 15,
                          ),
                          Text('categories',
                              style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => onDrawerItemSelected(DrawerItem.settings),
                      child: Row(
                        children: [
                          const Icon(Icons.settings),
                          const SizedBox(
                            width: 15,
                          ),
                          Text('Settings',
                              style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum DrawerItem{
  categories,
  settings,
}
