import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Banner extends StatelessWidget {
  final List list;

  const Banner({required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Swiper(
        autoplay: true,
        // scale: 0.8,
        // viewportFraction: 1,
        itemBuilder: (BuildContext context, int index) {
          // return CachedNetworkImage(
          //   imageUrl: list[index],
          //   // placeholder: (context, url) => const CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          //   fit: BoxFit.cover,
          // );
          return Image.asset(list[index]);
        },
        itemCount: list.length,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            // activeColor: Colors.red,
            // color: Colors.white,
            activeSize: 5,
            size: 5,
          ),
        ),
        // control: const SwiperControl(),
      ),
    );
  }
}
