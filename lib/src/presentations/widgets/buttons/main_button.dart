import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.blue, // Set the background color of the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48), // Set the border radius of the button
        ),
      ),
      child: Container(
        height: 48.h,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(48),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: AppTheme.fontFamily,
              fontWeight: FontWeight.bold,
              color: AppTheme.white,
            ),
          ),
        ),
      ),
    );
  }
}
