import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class SourceItem extends StatelessWidget {
  SourceItem({super.key, required this.sourceName, required this.isSelected});

  String sourceName;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected == true ? AppTheme.primary : AppTheme.white,
          border: Border.all(
           width: 2,
            color: AppTheme.primary),
          borderRadius: const BorderRadius.all(Radius.circular(25)) 
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(sourceName, style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: isSelected == true ? AppTheme.white : AppTheme.primary
          )),
        )),
    );
  }
}