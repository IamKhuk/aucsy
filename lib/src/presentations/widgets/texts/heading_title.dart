import 'package:flutter/cupertino.dart';

import '../../../theme/app_theme.dart';

class HeadingTitle extends StatelessWidget {
  const HeadingTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: AppTheme.fontFamily,
        color: AppTheme.white,
        height: 1.4,
        letterSpacing: 0.2,
      ),
    );
  }
}
