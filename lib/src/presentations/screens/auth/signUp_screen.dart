import 'package:aucsy/src/presentations/dialog/center_dialog.dart';
import 'package:aucsy/src/presentations/screens/auth/verification_screen.dart';
import 'package:aucsy/src/presentations/widgets/buttons/main_button.dart';
import 'package:aucsy/src/presentations/widgets/texts/heading_text.dart';
import 'package:aucsy/src/presentations/widgets/texts/heading_text_field.dart';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:aucsy/src/utils/validators.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60,
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
                  bottom: 112,
                ),
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: HeadingText(
                          text: 'Create your Aucsy account',
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
                  const HeadingTextField(text: 'Email'),
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
                        controller: _emailController,
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
                          hintText: 'Enter your email',
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
                      child: MainButton(
                        text: "Sign Up",
                        onPressed: () {
                          if (_fullNameController.text.contains(' ') &&
                              _fullNameController.text.length > 4 &&
                              _usernameController.text.isNotEmpty &&
                              Validators.emailValidator(
                                      _emailController.text) ==
                                  true &&
                              Validators.passwordValidator(
                                      _passController.text) ==
                                  true &&
                              _passController.text ==
                                  _passAgainController.text) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const VerificationScreen();
                                },
                              ),
                            );
                          }else if(_fullNameController.text.contains(' ')==false &&
                              _fullNameController.text.length <= 4 &&
                              _usernameController.text.isEmpty &&
                              Validators.emailValidator(
                                  _emailController.text) ==
                                  false &&
                              Validators.passwordValidator(
                                  _passController.text) ==
                                  false){
                            CenterDialog.showActionFailed(
                              context,
                              'Error',
                              'Please fill the forms to sign up',
                            );
                          } else if (_fullNameController.text.contains(' ')==false ||
                              _fullNameController.text.length <= 4) {
                            CenterDialog.showActionFailed(
                              context,
                              'Error',
                              'Enter valid Full Name',
                            );
                          } else if (_usernameController.text.isEmpty) {
                            CenterDialog.showActionFailed(
                              context,
                              'Error',
                              'This username is not valid or already taken\nPlease enter other username',
                            );
                          } else if (Validators.emailValidator(
                                  _emailController.text) ==
                              false) {
                            CenterDialog.showActionFailed(
                              context,
                              'Error',
                              'Please enter valid email address',
                            );
                          } else if (Validators.passwordValidator(
                                  _passController.text) ==
                              false) {
                            CenterDialog.showActionFailed(
                              context,
                              'Password Error',
                              'Your password must contain at least one:\n- Uppercase letter\n- Special character\n- Number (0,...,9)',
                            );
                          } else if(_passController.text !=
                              _passAgainController.text){
                            CenterDialog.showActionFailed(
                              context,
                              'Password Error',
                              'Confirming password must be the same as previously entered password',
                            );
                          } else {
                            _resetValues();
                            CenterDialog.showActionFailed(
                              context,
                              'Error',
                              'Something went wrong\nPlease try again',
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 24.w),
                  ],
                ),
                SizedBox(height: Platform.isIOS ? 24.h : 32.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _resetValues(){
    setState(() {
      _fullNameController.text='';
      _usernameController.text='';
      _emailController.text='';
      _passController.text='';
      _passAgainController.text='';
    });
  }
}
