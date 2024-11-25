import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/home_screen.dart';
import 'package:news/settings/settings_tab.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

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
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => HomeScreen()),
                        // );
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.menu),
                          const SizedBox(
                            width: 15,
                          ),
                          Text('Categories',
                              style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const SettingsTab()),
                        // );
                      },
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
