import 'package:aucsy/src/presentations/widgets/texts/main_title.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60,
        centerTitle: true,
        leading: Row(
          children: [
            const SizedBox(width: 12),
            InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {},
              child: Container(
                height: 48,
                width: 48,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    height: 24,
                    width: 24,
                    color: AppTheme.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        title: const MainTitle(text: "Home"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 2,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {},
              child: Container(
                height: 48,
                width: 48,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    // height: 24,
                    // width: 24,
                    color: AppTheme.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 22,
          bottom: 92,
        ),

      ),
    );
  }
}
