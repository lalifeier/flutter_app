import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  final double height;
  final String placeholderText;
  final Color background;

  // TextEditingController controller;

  const SearchBar({
    this.placeholderText = '',
    this.height = 32,
    this.background = Colors.white,
  });

  Widget _buildView() {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Icon(
                Icons.search,
                color: Colors.black54,
                size: 19.sp,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(
                //   () => SearchPage(),
                //   transition: Transition.downToUp,
                // );
              },
              child: Container(
                margin: EdgeInsets.only(left: 5.w),
                child: Text(
                  placeholderText,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height.h,
      child: _buildView(),
    );
  }
}
