import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppTheme.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppTheme.white,
        letterSpacing: 1.5,
      ),
    );
  }
}
