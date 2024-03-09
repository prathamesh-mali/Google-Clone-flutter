import 'package:flutter/material.dart';
import 'package:google_clone/widgets/web/search_button.dart';

class SearchButtons extends StatefulWidget {
  const SearchButtons({super.key});

  @override
  State<SearchButtons> createState() => _SearchButtonsState();
}

class _SearchButtonsState extends State<SearchButtons> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SearchButton(
          title: "Google Search",
        ),
        SizedBox(
          width: 5,
        ),
        SearchButton(
          title: "Im' Feeling Lucky",
        ),
      ],
    );
  }
}
