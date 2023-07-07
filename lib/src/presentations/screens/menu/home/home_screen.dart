import 'package:aucsy/src/presentations/dialog/bottom_dialog.dart';
import 'package:aucsy/src/presentations/screens/menu/home/explore_screen.dart';
import 'package:aucsy/src/presentations/screens/menu/home/product_details_screen.dart';
import 'package:aucsy/src/presentations/widgets/containers/active_product_container.dart';
import 'package:aucsy/src/presentations/widgets/containers/product_container.dart';
import 'package:aucsy/src/presentations/widgets/texts/heading_title.dart';
import 'package:aucsy/src/presentations/widgets/texts/main_title.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/dataSources/local/defaults/defaults.dart';
import '../../../../domain/models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> myActions = [];
  List<ProductModel> ongoing = [];
  List<ProductModel> upcoming = [];
  List<ProductModel> trending = [];

  @override
  void initState() {
    for (int i = 0; i <= Defaults().products.length - 1; i++) {
      if (Defaults().products[i].id < 3) {
        myActions.add(Defaults().products[i]);
      }
      if (Defaults().products[i].id >= 2 && Defaults().products[i].id <= 4) {
        ongoing.add(Defaults().products[i]);
      }
      if (Defaults().products[i].id >= 4 && Defaults().products[i].id <= 6) {
        upcoming.add(Defaults().products[i]);
      }
      if (Defaults().products[i].ctg == 'Trending') {
        trending.add(Defaults().products[i]);
      }
    }
    _scrollController.addListener(_handleScroll);
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();
  bool _showDarkAppBar = true;

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    setState(() {
      _showDarkAppBar = _scrollController.offset <= kToolbarHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: _showDarkAppBar ? Colors.transparent : AppTheme.dark,
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExploreScreen(),
                  ),
                );
              },
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
        controller: _scrollController,
        padding: const EdgeInsets.only(
          top: 22,
          bottom: 112,
        ),
        children: [
          Row(
            children: const [
              SizedBox(width: 24),
              HeadingTitle(text: "My Auctions"),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 232,
            child: ListView.builder(
              itemCount: myActions.length,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) =>
                              ProductDetailsScreen(product: myActions[index]),
                        ),
                      ),
                      child: ActiveProductContainer(product: myActions[index]),
                    ),
                    index == myActions.length - 1
                        ? Container()
                        : const SizedBox(width: 16),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: const [
              SizedBox(width: 24),
              HeadingTitle(text: "Ongoing"),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 236,
            child: ListView.builder(
              itemCount: ongoing.length,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) =>
                              ProductDetailsScreen(product: ongoing[index]),
                        ),
                      ),
                      child: ProductContainer(product: ongoing[index]),
                    ),
                    index == ongoing.length - 1
                        ? Container()
                        : const SizedBox(width: 16),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: const [
              SizedBox(width: 24),
              HeadingTitle(text: "Upcoming"),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 236,
            child: ListView.builder(
              itemCount: upcoming.length,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    ProductContainer(product: upcoming[index]),
                    index == upcoming.length - 1
                        ? Container()
                        : const SizedBox(width: 16),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: const [
              SizedBox(width: 24),
              HeadingTitle(text: "Trending"),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 236,
            child: ListView.builder(
              itemCount: trending.length,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    ProductContainer(product: trending[index]),
                    index == trending.length - 1
                        ? Container()
                        : const SizedBox(width: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
