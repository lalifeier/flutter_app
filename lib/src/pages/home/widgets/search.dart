import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/search_bar.dart';
import '../../index.dart';

class Search extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SearchBar(),
      ],
    );
  }
}
