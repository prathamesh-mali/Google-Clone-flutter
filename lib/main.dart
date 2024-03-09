import 'package:flutter/material.dart';
import 'package:google_clone/Screens/mobile_screen.dart';
import 'package:google_clone/Screens/search_screen.dart';
import 'package:google_clone/Screens/web_screen.dart';
import 'package:google_clone/Constants/colors.dart';
import 'package:google_clone/responsive/responsive_layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      title: 'Google Clone',
      home: const ResponsivelayoutScreen(
        mobileScreenLayout: MobileScreen(),
        webScreenLayout: WebScreen(),
      ),
      // home: const SearchScreen(),
    );
  }
}
