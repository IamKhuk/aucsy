import 'package:aucsy/src/presentations/widgets/buttons/main_button.dart';
import 'package:aucsy/src/presentations/widgets/texts/heading_text.dart';
import 'package:aucsy/src/presentations/widgets/texts/heading_text_field.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import '../../widgets/buttons/leading_back.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 72,
        leading: const LeadingBack(),
      ),
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
                  top: 22,
                  bottom: 32,
                ),
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: HeadingText(
                          text:
                          'Create your Aucsy account',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28.h),
                  const HeadingTextField(text: 'Full Name'),
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
                        controller: _fullNameController,
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
                          hintText: 'Enter your full name',
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
                  SizedBox(height: 16.h),
                  const HeadingTextField(text: 'Username'),
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
                        controller: _usernameController,
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
                          hintText: 'Enter your username',
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
                  SizedBox(height: 16.h),
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
                        obscureText: true,
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
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const HeadingTextField(text: 'Confirm Password'),
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
                        controller: _passAgainController,
                        enableSuggestions: true,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: AppTheme.blue,
                        obscureText: true,
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
                          hintText: 'Confirm your password',
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
                      child: MainButton(text: "Sign In", onPressed: () {}),
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
