import 'package:flutter/material.dart';

class PrivacyTipWidget extends StatelessWidget {
  const PrivacyTipWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: const [
        Text('我已阅读并同意'),
        InkWell(
          child: Text(
            '《用户服务协议》',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        Text('、'),
        InkWell(
          child: Text(
            '《隐私保护政策》',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        Text('和'),
        InkWell(
          child: Text(
            '《联通统一认证服务条款》',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        Text('并授予应用获得本机号码'),
      ],
    );
  }
}
