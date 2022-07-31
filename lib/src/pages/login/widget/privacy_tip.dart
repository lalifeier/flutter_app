import 'package:flutter/material.dart';

class PrivacyTipWidget extends StatelessWidget {
  const PrivacyTipWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: const [
        // Obx(() =>
        //     Checkbox(value: controller.isPrivacyTipChecked, onChanged: (value) {})),
        Text(
          '我已阅读并同意',
        ),
        InkWell(
          child: Text(
            '《用户服务协议》',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        Text(
          '及',
        ),
        InkWell(
          child: Text(
            '《隐私保护政策》',
            style: TextStyle(color: Colors.blueAccent),
          ),
        )
      ],
    );
  }
}
