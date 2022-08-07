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
    // controller.mobileController.addListener(() {
    //   setState(() {});
    // });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('登录'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Center(
                //   child: Text(
                //     '登录',
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 40),
                const Text(
                  '欢迎会员',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                _buildLoginFormWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginFormWidget(BuildContext context) {
    // return GestureDetector(
    // behavior: HitTestBehavior.translucent,
    // onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
    // child:
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
            decoration: InputDecoration(
              labelText:
                  controller.mobileController.text == '' ? '请输入手机号' : "手机号",
              hintText: "请输入手机号",
              prefixIcon: const Padding(
                padding: EdgeInsets.all(20),
                child: Text('+86'),
              ),
              suffix: Obx(
                () => Visibility(
                  visible: controller.showClear.value,
                  child: GestureDetector(
                    onTap: controller.removePhone,
                    child: const Icon(Icons.close),
                  ),
                ),
              ),
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11)
            ],
            validator: (v) {
              // print('======');
              // print(v);
              // print('======');
              return isMobile(v!) ? null : "手机格式有误";
            },
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              TextFormField(
                controller: controller.codeController,
                decoration: const InputDecoration(
                  labelText: "验证码",
                  hintText: "请输入短信验证码",
                  // contentPadding: EdgeInsets.symmetric(vertical: 20),
                  // suffixIcon: GestureDetector(
                  //   onTap: () {
                  //     FocusScope.of(context).requestFocus(FocusNode());
                  //   },
                  //   child: VerifyCodeWidget(),
                  // ),
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

                // textInputAction: TextInputAction.done,
              ),
              VerifyCodeWidget(),
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
              child: Obx(
                () => ElevatedButton(
                  onPressed:
                      controller.isValid.isTrue ? controller.onLogin : null,
                  child: const Text('登录'),
                ),
              ),
            ),
          )
        ],
      ),
      // ),
    );
  }
}
