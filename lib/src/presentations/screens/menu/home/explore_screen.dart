import 'package:aucsy/src/data/dataSources/local/defaults/defaults.dart';
import 'package:aucsy/src/presentations/screens/menu/home/product_details_screen.dart';
import 'package:aucsy/src/presentations/widgets/buttons/leading_back.dart';
import 'package:aucsy/src/presentations/widgets/containers/explore_product_container.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import '../../../widgets/texts/main_title.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController searchController = TextEditingController();
  bool onKeyboard = false;
  int selectedCtg = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60,
        centerTitle: true,
        leading: const LeadingBack(),
        title: const MainTitle(text: "Explore"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            setState(() {
              onKeyboard = false;
            });
          }
        },
        child: ListView(
          padding: EdgeInsets.only(
            top: 8,
            bottom: Platform.isIOS ? 24 : 32,
          ),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Row(
              children: [
                const SizedBox(width: 24),
                Expanded(
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: onKeyboard == false
                          ? Colors.transparent
                          : AppTheme.gray.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                      ),
                      child: TextField(
                        enabled: true,
                        controller: searchController,
                        enableSuggestions: true,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: AppTheme.blue,
                        enableInteractiveSelection: true,
                        style: const TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: AppTheme.white,
                        ),
                        autofocus: true,
                        decoration: InputDecoration(
                          focusColor: AppTheme.white.withOpacity(0.5),
                          icon: SizedBox(
                            width: 24,
                            child: SvgPicture.asset(
                              "assets/icons/search.svg",
                              height: 24,
                              width: 24,
                              color: AppTheme.white,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: 'Search something...',
                          hintStyle: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            height: 1.5,
                            color: AppTheme.gray.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 32,
              child: ListView.builder(
                itemCount: Defaults().ctg.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCtg = index;
                          });
                        },
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: selectedCtg == index
                                ? AppTheme.blue
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              Defaults().ctg[index],
                              style: TextStyle(
                                color: selectedCtg == index
                                    ? AppTheme.white
                                    : AppTheme.gray,
                                fontSize: 12,
                                fontFamily: AppTheme.fontFamily,
                                fontWeight: FontWeight.w600,
                                height: 16,
                                letterSpacing: 0.24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      index == Defaults().ctg.length - 1
                          ? Container()
                          : const SizedBox(width: 16),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              itemCount: Defaults().products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) =>
                              ProductDetailsScreen(product: Defaults().products[index]),
                        ),
                      ),
                      child: ExploreProductContainer(
                        product: Defaults().products[index],
                      ),
                    ),
                    index == Defaults().products.length - 1
                        ? Container()
                        : const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
