import 'dart:async';

import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class DueTimeContainer extends StatefulWidget {
  const DueTimeContainer({
    Key? key,
    required this.endTime,
  }) : super(key: key);

  final DateTime endTime;

  @override
  State<DueTimeContainer> createState() => _DueTimeContainerState();
}

class _DueTimeContainerState extends State<DueTimeContainer> {
  late Timer _timer;
  Duration _duration = const Duration();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        final now = DateTime.now();
        if (widget.endTime.isAfter(now)) {
          _duration = widget.endTime.difference(now);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    if (hours == '00') {
      return "${minutes}m : ${seconds}s";
    } else if (hours == '00' && minutes == '00') {
      return "${seconds}s";
    } else if (hours == '00' && minutes == '00' && seconds == '00') {
      return "";
    }

    return "${hours}h : ${minutes}m : ${seconds}s";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppTheme.dark.withOpacity(0.6),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(
        _formatDuration(_duration),
        style: const TextStyle(
          fontFamily: AppTheme.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppTheme.white,
        ),
      ),
    );
  }
}
