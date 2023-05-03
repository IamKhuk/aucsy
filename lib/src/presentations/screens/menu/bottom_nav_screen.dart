import 'dart:io';
import 'package:aucsy/src/presentations/screens/menu/add_product/add_product_screen.dart';
import 'package:aucsy/src/presentations/screens/menu/home/home_screen.dart';
import 'package:aucsy/src/presentations/screens/menu/profile/profile_screen.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

int selectedIndex = 0;

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  List<Widget> data = [
    const HomeScreen(),
    const AddProductScreen(),
    const ProfileScreen(),
  ];

  Future<bool> showExitPopup(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: SizedBox(
            height: 90.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you want to exit?",
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.white,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                        },
                        // style: ElevatedButton.styleFrom(backgroundColor: AppTheme.blue),
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.blue),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        // style: ElevatedButton.styleFrom(
                        //   backgroundColor: kWhiteColor,
                        // ),
                        child: Text(
                          "No",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        body: Stack(
          children: [
            data[selectedIndex],
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: size.width,
                child: Row(
                  children: [
                    const Spacer(),
                    Container(
                      height: 80,
                      padding: const EdgeInsets.all(16),
                      margin: EdgeInsets.only(
                          left: 16, bottom: Platform.isIOS ? 24 : 32, right: 16),
                      decoration: BoxDecoration(
                        color: AppTheme.dark,
                        borderRadius: BorderRadius.circular(80),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 25,
                            spreadRadius: 0,
                            color: AppTheme.dark.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 270),
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: selectedIndex == 0
                                    ? AppTheme.blue
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(48),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(48),
                                onTap: () {
                                  if (selectedIndex != 0) {
                                    setState(() {
                                      selectedIndex = 0;
                                    });
                                  }
                                },
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/home.svg',
                                    color: selectedIndex == 0
                                        ? AppTheme.white
                                        : AppTheme.gray.withOpacity(0.6),
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 24.w),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 270),
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: selectedIndex == 1
                                    ? AppTheme.blue
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(48),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(48),
                                onTap: () {
                                  if (selectedIndex != 1) {
                                    setState(() {
                                      selectedIndex = 1;
                                    });
                                  }
                                },
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/plus.svg',
                                    color: selectedIndex == 1
                                        ? AppTheme.white
                                        : AppTheme.gray.withOpacity(0.6),
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 24.w),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 270),
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: selectedIndex == 2
                                    ? AppTheme.blue
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(48),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(48),
                                onTap: () {
                                  if (selectedIndex != 2) {
                                    setState(() {
                                      selectedIndex = 2;
                                    });
                                  }
                                },
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/profile.svg',
                                    color: selectedIndex == 2
                                        ? AppTheme.white
                                        : AppTheme.gray.withOpacity(0.6),
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget navItem() {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 270),
    child: InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const MapScreen(),
        //   ),
        // );
      },
      child: Container(
        height: 48,
        width: 48,
        decoration: const BoxDecoration(
          color: AppTheme.blue,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/profile.svg',
              color: AppTheme.white,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    ),
  );
}
