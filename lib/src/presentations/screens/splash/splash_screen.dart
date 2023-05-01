import 'dart:async';
import 'package:aucsy/src/presentations/screens/splash/onBoarding_screen.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? offset;

  @override
  void initState() {
    _nextScreen();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1270),
    )..forward();
    offset = Tween<Offset>(
      begin: const Offset(0.0, 4.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LOADING',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: AppTheme.fontFamily,
                        letterSpacing: 0.14,
                        color: AppTheme.blue.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: SlideTransition(
              position: offset!,
              child: const Text(
                "Aucsy",
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: AppTheme.fontFamily,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.blue,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Future<void> _setLanguage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var lan = prefs.getString('language') ?? "uz";
  //   var localizationDelegate = LocalizedApp.of(context).delegate;
  //   localizationDelegate.changeLocale(Locale(lan));
  // }

  _nextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("firstOpen") != null) {
      isLoginPage = true;
    } else {
      prefs.setString("firstOpen", "value");
      isLoginPage = false;
    }
    token = prefs.getString('token') ?? "";

    Timer(
      const Duration(milliseconds: 2270),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return OnBoardingScreen();
              // return isLoginPage == false
              //     ? OnBoardingScreen()
              //     : token == ""
              //         ? LoginScreen()
              //         : MainScreen();
            },
          ),
        );
      },
    );
  }
}
