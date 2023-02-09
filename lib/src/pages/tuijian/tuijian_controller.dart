import 'package:get/get.dart';

// GetSingleTickerProviderStateMixin
// GetTickerProviderStateMixin
class TuiJianController extends GetxController {
  late final List bannerList;

  late final List jingangList;

  @override
  void onInit() {
    bannerList = [
      'assets/images/banner/淘宝-99天猫主会场.jpg',
      'assets/images/banner/淘宝-美食神券专场.png',
      'assets/images/banner/淘宝-天猫国际会场99.jpg',
      'assets/images/banner/淘宝-天猫中秋节.jpg',
      'assets/images/banner/【淘特】新人.jpg',
      'assets/images/banner/专题-暖心丰收季.png',
      'assets/images/banner/专题-中秋团圆季.png',
    ];

    jingangList = [
      [
        {'title': '京东省钱', 'src': 'assets/images/jingang/京东省钱.png'},
        {'title': '外卖优惠', 'src': 'assets/images/jingang/外卖优惠.png'},
      ],
      [
        {'title': '拼多多省钱', 'src': 'assets/images/jingang/拼多多省钱.png'},
        {'title': '话费充值', 'src': 'assets/images/jingang/话费充值.png'},
      ],
      [
        {'title': '抖音热销榜', 'src': 'assets/images/jingang/抖音热销榜.gif'},
        {'title': '百亿补贴', 'src': 'assets/images/jingang/百亿补贴.png'},
      ],
      [
        {'title': '唯品会', 'src': 'assets/images/jingang/唯品会.gif'},
        {'title': '猫超包邮', 'src': 'assets/images/jingang/猫超包邮.gif'},
      ],
      [
        {'title': '美团外卖', 'src': 'assets/images/jingang/美团外卖.png'},
        {'title': '折上折', 'src': 'assets/images/jingang/折上折.png'},
      ],
      [
        {'title': '全网热卖榜', 'src': 'assets/images/jingang/全网热卖榜.gif'},
        {'title': '进口好物', 'src': 'assets/images/jingang/进口好物.png'},
      ],
      [
        {'title': '优惠情报', 'src': 'assets/images/jingang/优惠情报.gif'},
        {'title': '飞猪', 'src': 'assets/images/jingang/飞猪.png'},
      ],
      [
        {'title': '吃喝玩乐', 'src': 'assets/images/jingang/吃喝玩乐.png'},
        {'title': '阿里健康', 'src': 'assets/images/jingang/阿里健康.png'},
      ],
      [
        {'title': '整点秒杀', 'src': 'assets/images/jingang/整点秒杀.gif'},
        {'title': '限时爆品', 'src': 'assets/images/jingang/限时爆品.png'},
      ],
      // [
      //   {'title': '淘宝特价', 'src': 'assets/images/jingang/淘宝特价.png'},
      // ]
    ];

    super.onInit();
  }
}
