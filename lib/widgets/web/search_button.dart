import 'package:flutter/material.dart';
import 'package:google_clone/Constants/colors.dart';

class SearchButton extends StatelessWidget {
  final String title;
  const SearchButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 25,
      ),
      color: searchColor,
      elevation: 0,
      onPressed: () {},
      child: Text(title),
    );
  }
}
