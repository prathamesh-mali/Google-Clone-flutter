import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResponsivelayoutScreen extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;

  const ResponsivelayoutScreen(
      {Key? key,
      required this.mobileScreenLayout,
      required this.webScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 768) {
        return mobileScreenLayout;
      } else {
        return webScreenLayout;
      }
    });
  }
}
