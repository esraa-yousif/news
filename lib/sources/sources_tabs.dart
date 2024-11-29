import 'package:flutter/material.dart';
import 'package:news/models/source_model.dart';
import 'package:news/sources/source_item.dart';


class SourcesTabs extends StatefulWidget {
   SourcesTabs(this.sources, {super.key});

  List<SourceModel> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap:
             (index) {
              selectedTabIndex = index;
              setState(() {});
              },
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            isScrollable: true,
            tabs: widget.sources.map((source) => SourceItem(
              isSelected: widget.sources.indexOf(source) == selectedTabIndex,
              sourceName: source.name)).toList()
            ),
        ),
      ],
    );
  }
}