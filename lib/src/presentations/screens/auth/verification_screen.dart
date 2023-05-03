import 'dart:async';
import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'dart:io';
import '../../widgets/buttons/leading_back.dart';
import '../../widgets/buttons/main_button.dart';
import '../../widgets/texts/heading_text.dart';
import 'login_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with CodeAutoFill {
  final _pinPutFocusNode = FocusNode();
  final _pinPutController = TextEditingController();
  bool _isLoading = false;
  int timer = 120;
  Timer? _timer;

  void codeUpdated() {
    setState(() {
      _pinPutController.text = code!;
    });
  }

  @override
  void initState() {
    listenForCode();
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: AppTheme.white,
    border: Border.all(color: AppTheme.gray),
    borderRadius: BorderRadius.circular(16),
  );

  final defaultPinTheme = PinTheme(
    width: 68,
    height: 72,
    textStyle: const TextStyle(
      fontSize: 22,
      fontFamily: AppTheme.fontFamily,
      color: AppTheme.white,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: AppTheme.gray.withOpacity(0.6),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );

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
      body: Stack(
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
                            'Enter the Verification Code Sent to Your Email to Access the Full Features of our NFT Marketplace App',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28.h),
                timer > 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$timer s.',
                            style: const TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                              height: 1.8,
                              color: AppTheme.white,
                            ),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(height: 40.h),
                Pinput(
                  controller: _pinPutController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyDecorationWith(
                    border: Border.all(
                      color: AppTheme.gray.withOpacity(0.6),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  submittedPinTheme: defaultPinTheme,
                  validator: (s) {
                    return s == '2222' ? null : 'Pin is incorrect';
                  },
                  onSubmitted: (String pin) {
                    _initPinPut(pin);
                  },
                  focusNode: _pinPutFocusNode,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
                timer == 0
                    ? Column(
                        children: [
                          SizedBox(height: 32.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Did not get the code? ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.5,
                                  fontFamily: AppTheme.fontFamily,
                                  color: AppTheme.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    timer = 120;
                                  });
                                  _startTimer();
                                },
                                child: const Text(
                                  'Send Again',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    height: 1.5,
                                    fontFamily: AppTheme.fontFamily,
                                    color: AppTheme.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
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
                      text: "Send Code",
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
                  ),
                  SizedBox(width: 24.w),
                ],
              ),
              SizedBox(height: Platform.isIOS ? 24.h : 32.h),
            ],
          ),
        ],
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        timer--;
        if (timer == 0) {
          _timer!.cancel();
        }
        setState(() {});
      },
    );
  }

  Future<void> _initPinPut(String pin) async {
    setState(() {
      _isLoading = true;
    });
    setState(() {
      _isLoading = false;
    });
  }
}
