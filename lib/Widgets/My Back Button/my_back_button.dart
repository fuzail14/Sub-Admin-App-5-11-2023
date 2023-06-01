import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

class MyBackButton extends StatelessWidget {
  final String? text;
  final Widget? widget;
  final void Function()? onTap;

  const MyBackButton({this.text, this.widget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(38), top: ScreenUtil().setHeight(72)),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap ??
                () {
                  Get.back();
                },
            child: Container(
              child: SvgPicture.asset(
                "assets/arrow_back.svg",
                width: 26,
              ),
            ),
          ),
          20.pw,
          Text(
            text!,
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black),
          ),
          Container(
            child: widget,
          )
        ],
      ),
    );
  }
}
