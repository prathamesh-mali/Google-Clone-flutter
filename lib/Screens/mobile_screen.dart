import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/Constants/colors.dart';
import 'package:google_clone/widgets/mobile_footer.dart';
import 'package:google_clone/widgets/search_widget.dart';
import 'package:google_clone/widgets/web/search_buttons.dart';
import 'package:google_clone/widgets/web/translation_button.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          elevation: 0,
          title: SizedBox(
            width: size.width * 0.34,
            child: const DefaultTabController(
              length: 2,
              child: TabBar(
                labelColor: blueColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: blueColor,
                tabs: [
                  Tab(
                    child: Text("All"),
                  ),
                  Tab(
                    child: Text("Images"),
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/more-apps.svg',
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
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height * 0.6,
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
                      ],
                    ),
                  ),
                  const MobileFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
