import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/app_theme.dart';

class LeadingBack extends StatelessWidget {
  const LeadingBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 12),
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 48,
            width: 48,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/back.svg',
                height: 24,
                width: 24,
                color: AppTheme.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}