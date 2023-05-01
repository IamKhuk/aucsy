import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w900,
        fontFamily: AppTheme.fontFamily,
        color: AppTheme.white,
        height: 1.4,
      ),
    );
  }
}
