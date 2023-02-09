import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperKit extends StatelessWidget {
  final List list;
  final double? height;
  final double? radius;
  final int? autoplayDelay;
  final int? indicatorWidth;
  final int? indicatorHeight;
  final double? scale;
  final double? viewportFraction;

  const SwiperKit({
    required this.list,
    this.height = 135,
    this.radius = 12,
    this.autoplayDelay = 5000,
    this.indicatorWidth = 6,
    this.indicatorHeight = 6,
    this.scale = 0.8,
    this.viewportFraction = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.h),
      height: height!.h,
      child: Swiper(
        itemCount: list.length,
        autoplay: true,
        autoplayDelay: autoplayDelay!,
        duration: 800,
        viewportFraction: viewportFraction!,
        scale: scale!,
        pagination: SwiperCustomPagination(
          builder: (BuildContext context, SwiperPluginConfig config) {
            return Positioned(
              left: 0,
              right: 0,
              bottom: 7.h,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _bannerPagetion(config.itemCount, config.activeIndex)
                  ],
                ),
              ),
            );
          },
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 12.w, right: 12.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius!.r),
              child: Container(
                color: const Color(0xffeeeeee),
                child: Image.asset(
                  list[index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _bannerPagetion(int count, int activeIndex) {
    List<Widget> list = [];

    for (var i = 0; i < count; i++) {
      list.add(Container(
        width: indicatorWidth!.r,
        height: indicatorHeight!.r,
        margin: EdgeInsets.only(right: i + 1 != count ? 5.w : 0),
        decoration: BoxDecoration(
          color: activeIndex == i
              ? const Color(0xfff2534e)
              : const Color(0xffe0d7ce),
          borderRadius: BorderRadius.circular(45.r),
        ),
      ));
    }

    return Row(children: list);
  }
}
