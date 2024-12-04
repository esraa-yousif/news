import 'package:flutter/material.dart';
import 'package:news/models/sources_response/source.dart';
import 'package:news/news/news_list.dart';
import 'package:news/sources/source_item.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs(this.sources, {super.key});

  final List<Source> sources;

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
              onTap: (index) {
                selectedTabIndex = index;
                setState(() {});
              },
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => SourceItem(
                      isSelected:
                          widget.sources.indexOf(source) == selectedTabIndex,
                      sourceName: source.name ?? ''))
                  .toList()),
        ),
         Expanded(child: NewsList(widget.sources[selectedTabIndex].id!))
      ],
    );
  }
}
