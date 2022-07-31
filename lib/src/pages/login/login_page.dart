import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/is.dart';
import 'login_controller.dart';
import 'widget/privacy_tip.dart';
import 'widget/verify_code.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('登录'),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    '登录',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  '欢迎会员',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                LoginFormWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget LoginFormWidget(BuildContext context) {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: () {
        controller.isValid.value = controller.formKey.currentState!.validate();
      },
      child: Column(
        children: [
          TextFormField(
            // autofocus: true,
            controller: controller.mobileController,
            decoration: const InputDecoration(
              labelText: "手机号",
              hintText: "请输入手机号",
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11)
            ],
            validator: (v) {
              return isMobile(v!) ? null : "手机格式有误";
            },
          ),
          Stack(
            // alignment: Alignment.centerRight,
            children: [
              TextFormField(
                controller: controller.codeController,
                decoration: const InputDecoration(
                  labelText: "验证码",
                  hintText: "请输入短信验证码",
                ),
                obscureText: true,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6)
                ],
                validator: (v) {
                  return v!.length == 6 ? null : "验证码少于6位";
                },
              ),
              SizedBox(
                height: 70,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: VerifyCodeWidget(),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: PrivacyTipWidget(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(height: 56),
              child: Obx(() => ElevatedButton(
                    onPressed:
                        controller.isValid.isTrue ? controller.onLogin : null,
                    child: const Text('登录'),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
