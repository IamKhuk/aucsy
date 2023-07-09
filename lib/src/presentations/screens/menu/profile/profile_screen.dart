import 'package:aucsy/src/data/dataSources/local/defaults/defaults.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../theme/app_theme.dart';
import '../../../../utils/constants/constants.dart';
import '../../../widgets/texts/main_title.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showDarkAppBar = true;
  bool onSale = true;

  @override
  void initState() {
    _scrollController.addListener(_handleScroll);
    super.initState();
  }

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
        leadingWidth: 24,
        centerTitle: false,
        title: const MainTitle(text: "My Account"),
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
                    'assets/icons/menu_end.svg',
                    height: 24,
                    width: 24,
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
          left: 24,
          right: 24,
          bottom: 112,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: "bid.bidderAvatar",
                    placeholder: (context, url) => Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppTheme.dark,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppTheme.dark,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.error_outline_outlined,
                          color: AppTheme.red,
                          size: 28,
                        ),
                      ),
                    ),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 36),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Khusan Khukumov',
                      style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 32,
                        fontFamily: AppTheme.fontFamily,
                        fontWeight: FontWeight.w500,
                        height: 1.05,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return Constants.usernameGradient.createShader(bounds);
                      },
                      child: const Text(
                        "@iamkhuk",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppTheme.fontFamily,
                          fontWeight: FontWeight.normal,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text(
                    '200',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 20,
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      letterSpacing: 0.40,
                    ),
                  ),
                  Text(
                    'Artwork',
                    style: TextStyle(
                      color: AppTheme.gray,
                      fontSize: 12,
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              ),
              Container(
                height: 72,
                width: 1,
                color: AppTheme.gray.withOpacity(0.2),
              ),
              Column(
                children: const [
                  Text(
                    '14K',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 20,
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      letterSpacing: 0.40,
                    ),
                  ),
                  Text(
                    'Followers',
                    style: TextStyle(
                      color: AppTheme.gray,
                      fontSize: 12,
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              ),
              Container(
                height: 72,
                width: 1,
                color: AppTheme.gray.withOpacity(0.2),
              ),
              Column(
                children: const [
                  Text(
                    '120',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 20,
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      letterSpacing: 0.40,
                    ),
                  ),
                  Text(
                    'Following',
                    style: TextStyle(
                      color: AppTheme.gray,
                      fontSize: 12,
                      fontFamily: AppTheme.fontFamily,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      letterSpacing: 0.24,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: const [
              Expanded(
                child: Text(
                  'Hello world I’m Khusan Khukumov, I’m from Uzbekistan and love to create a good stuff',
                  style: TextStyle(
                    color: AppTheme.gray,
                    fontSize: 14,
                    fontFamily: AppTheme.fontFamily,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                    letterSpacing: 0.28,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 48,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: AppTheme.gray.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          onSale = true;
                        });
                      },
                      child: AnimatedContainer(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: onSale == true
                              ? AppTheme.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(44),
                        ),
                        duration: const Duration(milliseconds: 270),
                        child: Text(
                          'On sale',
                          style: TextStyle(
                            color:
                                onSale == true ? AppTheme.white : AppTheme.gray,
                            fontSize: 12,
                            fontFamily: AppTheme.fontFamily,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            letterSpacing: 0.24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          onSale = false;
                        });
                      },
                      child: AnimatedContainer(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: onSale == false
                              ? AppTheme.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(44),
                        ),
                        duration: const Duration(milliseconds: 270),
                        child: Text(
                          ' Owned ',
                          style: TextStyle(
                            color: onSale == false
                                ? AppTheme.white
                                : AppTheme.gray,
                            fontSize: 12,
                            fontFamily: AppTheme.fontFamily,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            letterSpacing: 0.24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width - 48,
            color: AppTheme.gray.withOpacity(0.2),
          ),
          GridView.builder(
            itemCount: Defaults().products.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 24),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: (MediaQuery.of(context).size.width - 64) / 2,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return SizedBox(
                height: (MediaQuery.of(context).size.width - 64) / 2,
                width: (MediaQuery.of(context).size.width - 64) / 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    Defaults().products[index].img,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
