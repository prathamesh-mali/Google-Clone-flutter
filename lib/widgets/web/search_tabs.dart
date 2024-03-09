import 'package:flutter/material.dart';
import 'package:google_clone/widgets/web/search_tab.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SearchTab(
            icon: Icons.search,
            isActive: true,
            text: "All",
          ),
          SearchTab(
            icon: Icons.image,
            text: "Image",
          ),
          SearchTab(
            icon: Icons.map,
            text: "Map",
          ),
          SearchTab(
            icon: Icons.article,
            text: "News",
          ),
          SearchTab(
            icon: Icons.shop,
            text: "Shopping",
          ),
          SearchTab(
            icon: Icons.more_vert,
            text: "More",
          ),
        ],
      ),
    );
  }
}
