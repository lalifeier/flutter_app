import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/index.dart';

class JinGang extends StatefulWidget {
  final List list;

  const JinGang({required this.list});

  @override
  State<JinGang> createState() => _JinGangState();
}

class _JinGangState extends State<JinGang> {
  late ScrollController _scrollController;

  double _offsetRatio = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _createItem(String src, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          // child: Image.network(
          //   src,
          //   fit: BoxFit.fill,
          //   width: size,
          //   height: size,
          // ),
          child: Image.asset(
            src,
            width: 55,
            height: 55,
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      var position = _scrollController.position;

      setState(() {
        _offsetRatio = position.pixels / position.maxScrollExtent;
      });
    });

    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 160,
          child: ListView.builder(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemExtent: 80,
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: _createItem(
                      widget.list[index][0]['src'],
                      widget.list[index][0]['title'],
                    ),
                  ),
                  Expanded(
                    child: _createItem(
                      widget.list[index][1]['src'],
                      widget.list[index][1]['title'],
                    ),
                  )
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          child: Center(
            child: CustomPaint(
              painter: Scroolbar(offsetRatio: _offsetRatio),
              size: Size(
                ScreenUtil().setWidth(40),
                ScreenUtil().setHeight(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
