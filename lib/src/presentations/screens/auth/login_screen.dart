import 'package:aucsy/src/presentations/widgets/buttons/main_button.dart';
import 'package:aucsy/src/presentations/widgets/texts/heading_text.dart';
import 'package:aucsy/src/presentations/widgets/texts/heading_text_field.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: ListView(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 92,
                  bottom: 32,
                ),
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: HeadingText(
                          text:
                              'Ready to buy and sell NFTs? \nLog in to your Aucsy account.',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 48.h),
                  const HeadingTextField(text: 'Login'),
                  SizedBox(height: 8.h),
                  Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppTheme.bg,
                      borderRadius: BorderRadius.circular(48),
                      border: Border.all(
                        color: AppTheme.white.withOpacity(0.2),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 4,
                      ),
                      child: TextField(
                        enabled: true,
                        controller: _loginController,
                        enableSuggestions: true,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: AppTheme.blue,
                        enableInteractiveSelection: true,
                        style: const TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: AppTheme.white,
                        ),
                        autofocus: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your login',
                          hintStyle: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            height: 1.5,
                            color: AppTheme.gray.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  const HeadingTextField(text: 'Password'),
                  SizedBox(height: 8.h),
                  Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppTheme.bg,
                      borderRadius: BorderRadius.circular(48),
                      border: Border.all(
                        color: AppTheme.white.withOpacity(0.2),
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 5,
                      ),
                      child: TextField(
                        enabled: true,
                        controller: _passController,
                        enableSuggestions: true,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: AppTheme.blue,
                        obscureText: obscure,
                        enableInteractiveSelection: true,
                        style: const TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: AppTheme.white,
                        ),
                        autofocus: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            height: 1.5,
                            color: AppTheme.gray.withOpacity(0.6),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 14, bottom: 11, left: 22),
                              child: SvgPicture.asset(
                                'assets/icons/eye.svg',
                                color: obscure == true
                                    ? AppTheme.gray.withOpacity(0.6)
                                    : AppTheme.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ForgotPasswordScreen();
                          //     },
                          //   ),
                          // );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 2,
                            bottom: 2,
                            left: 15,
                          ),
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: AppTheme.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 44.h),
                  Row(
                    children: [
                      const Spacer(),
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          color: AppTheme.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ForgotPasswordScreen();
                          //     },
                          //   ),
                          // );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: AppTheme.blue,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    SizedBox(width: 24.w),
                    Expanded(
                      child: MainButton(text: "Log In", onPressed: () {}),
                    ),
                    SizedBox(width: 24.w),
                  ],
                ),
                SizedBox(height: Platform.isIOS ? 24.h : 32.h),
              ],
            )
          ],
        ),
      ),
    );
  }
}
