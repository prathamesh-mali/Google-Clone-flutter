import 'package:flutter/material.dart';
import 'package:google_clone/Constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/widgets/search_widget.dart';
import 'package:google_clone/widgets/web/search_buttons.dart';
import 'package:google_clone/widgets/web/translation_button.dart';
import 'package:google_clone/widgets/web/web_footer.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Gmail",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Images",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('images/more-apps.svg',
                colorFilter:
                    const ColorFilter.mode(primaryColor, BlendMode.srcIn)),
          ),
          const SizedBox(
            width: 10,
          ),
          MaterialButton(
            color: const Color(0xff1A73EB),
            onPressed: () {},
            child: const Text(
              "Sign IN",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.25,
            ),
            const Expanded(
              child: Column(
                children: [
                  Search(),
                  SizedBox(
                    height: 20,
                  ),
                  SearchButtons(),
                  SizedBox(
                    height: 20,
                  ),
                  TranslationButton(),
                ],
              ),
            ),
            WebFooter(),
          ],
        ),
      ),
    );
  }
}
