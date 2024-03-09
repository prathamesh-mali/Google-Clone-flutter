import 'package:flutter/material.dart';
import 'package:google_clone/Constants/colors.dart';

class SearchTab extends StatelessWidget {
  const SearchTab(
      {Key? key, required this.icon, required this.text, this.isActive = false})
      : super(key: key);

  final IconData icon;
  final bool isActive;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isActive ? blueColor : Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 15, color: isActive ? blueColor : Colors.grey),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        isActive
            ? Container(
                height: 3,
                width: 40,
                color: blueColor,
              )
            : Container()
      ],
    );
  }
}
