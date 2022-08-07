import 'dart:async';

import 'package:flutter/material.dart';

class VerifyCodeWidget extends StatefulWidget {
  // Function? onTimerStart;
  // Function? onTimerFinish;

  // VerifyCodeWidget({this.onTimerStart, this.onTimerFinish});

  @override
  State<VerifyCodeWidget> createState() => _VerifyCodeWidgetState();
}

class _VerifyCodeWidgetState extends State<VerifyCodeWidget> {
  late Timer _timer;
  int _countdownTime = 0;
  String verifyStr = '获取验证码';

  void startCountdownTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_countdownTime <= 1) {
          _timer.cancel();
          _countdownTime = 0;
          verifyStr = '重新获取';
          return;
        }

        _countdownTime -= 1;
        verifyStr = "$_countdownTime" 's';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _countdownTime == 0
        ? OutlinedButton(
            onPressed: () {
              if (_countdownTime == 0) {
                setState(() {
                  _countdownTime = 60;
                  verifyStr = "$_countdownTime" 's';
                });
                startCountdownTimer();
              }
            },
            child: Text(verifyStr),
          )
        : Container(
            alignment: Alignment.centerRight,
            child: Text(verifyStr),
          );

    // return Text(verifyStr);
  }
}
