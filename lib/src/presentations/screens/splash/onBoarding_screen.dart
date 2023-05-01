import 'package:aucsy/src/presentations/widgets/buttons/main_button.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'dart:io';
import '../auth/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 270),
    );
    _animationController.forward(from: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: VisibilityDetector(
        key: UniqueKey(),
        onVisibilityChanged: (visibilityInfo) {
          if (visibilityInfo.visibleFraction > 0.8) {
            _animationController.forward();
          } else {
            _animationController.reset();
          }
        },
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height-150,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/splash_img.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: Platform.isIOS? 24.h:32.h,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Colors.transparent,
                    // Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    AppTheme.black.withOpacity(0.05),
                    AppTheme.black.withOpacity(0.15),
                    AppTheme.black.withOpacity(0.30),
                    AppTheme.black,
                    AppTheme.black,
                    AppTheme.black,
                    AppTheme.black,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimationLimiter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 270),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          verticalOffset: MediaQuery.of(context).size.width,
                          child: FadeInAnimation(child: widget),
                        ),
                        delay: const Duration(milliseconds: 40),
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24,),
                            decoration: BoxDecoration(
                              color: AppTheme.dark,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Text(
                              'Aucsy',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: AppTheme.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          Row(
                            children: [
                              SizedBox(width: 12.w),
                              const Expanded(
                                child: Text(
                                  "Own a piece of digital history with our NFT marketplace!",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTheme.fontFamily,
                                    color: AppTheme.white,
                                    letterSpacing: 0.5,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(width: 12.w),
                            ],
                          ),
                          SizedBox(height: 32.h),
                          MainButton(
                            text: 'Let\' Explore 🔥',
                            onPressed: () {
                              Navigator.of(context).popUntil(
                                (route) => route.isFirst,
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginScreen();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
