import 'package:flutter/cupertino.dart';

import '../../../theme/app_theme.dart';

class HeadingTextField extends StatelessWidget {
  const HeadingTextField({
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
        fontSize: 18,
        fontWeight: FontWeight.bold,
        height: 1.5,
        color: AppTheme.white,
      ),
    );
  }
}
