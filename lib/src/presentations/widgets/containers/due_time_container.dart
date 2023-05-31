import 'dart:async';

import 'package:aucsy/src/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class DueTimeText extends StatefulWidget {
  const DueTimeText({
    Key? key,
    required this.endTime,
    this.textSize = 12,
    required this.onTimeChanged,
  }) : super(key: key);

  final DateTime endTime;
  final double textSize;
  final Function(bool time) onTimeChanged;

  @override
  State<DueTimeText> createState() => _DueTimeTextState();
}

class _DueTimeTextState extends State<DueTimeText> {
  late Timer _timer;
  Duration _duration = const Duration();
  late bool _isCountingUp;

  @override
  void initState() {
    super.initState();
    if(widget.endTime.isAfter(DateTime.now())){
      setState(() {
        _isCountingUp = false;
      });
    }else{
      setState(() {
        _isCountingUp = true;
      });
    }
    widget.onTimeChanged(_isCountingUp);
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
          _duration += const Duration(seconds: 1);
          _isCountingUp = true;
          widget.onTimeChanged(_isCountingUp);
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.remainder(24).toString();
    final minutes = duration.inMinutes.remainder(60).toString();
    final seconds = duration.inSeconds.remainder(60).toString();
    if (hours == '0') {
      return "${minutes}m : ${seconds}s";
    } else if (hours == '0' && minutes == '0') {
      return "${seconds}s";
    } else if (hours == '0' && minutes == '0' && seconds == '0') {
      return "";
    }

    return "${hours}h : ${minutes}m : ${seconds}s";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(_duration),
      style: TextStyle(
        fontFamily: AppTheme.fontFamily,
        fontSize: widget.textSize,
        fontWeight: widget.textSize>12? FontWeight.bold: FontWeight.normal,
        color: AppTheme.white,
        height: widget.textSize>12? 1.5 : 1,
      ),
    );
  }
}
