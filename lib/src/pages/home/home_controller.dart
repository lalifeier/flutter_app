import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  final text = 'Home'.obs;

  final List<String> imgList = [
    'https://img.alicdn.com/imgextra/i3/2053469401/O1CN016agaj12JJiBZpVncc_!!2053469401.jpg',
    'https://img.alicdn.com/imgextra/i4/2053469401/O1CN01i11egr2JJiA7bx10I_!!2053469401.png',
    'https://img.alicdn.com/imgextra/i2/2053469401/O1CN01JGzzk62JJi9LcKxMd_!!2053469401.jpg',
    'https://img.alicdn.com/imgextra/i3/2053469401/O1CN01iSmM9f2JJi7eWD1x7_!!2053469401.jpg',
  ];

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    print(text);

    // Loading.show();
  }
}
