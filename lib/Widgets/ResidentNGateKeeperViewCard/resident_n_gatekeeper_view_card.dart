import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

class ResidentsNGateKeeperViewCard extends StatelessWidget {
  ResidentsNGateKeeperViewCard(
      {required this.image, required this.name, required this.mobileno});
  String? image;

  String? name;
  String? mobileno;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 32.h,
      ),
      child: Container(
        width: 327.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/cardbackground.jpeg',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(189, 224, 224, 223),
              spreadRadius: 5,

              blurRadius: 9,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: HexColor('#FFFFFF'),
        ),
        height: 88.h,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 14.4.h, left: 4.w),
                child: Container(
                  width: 90.4.w,
                  height: 61.6.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image!), fit: BoxFit.cover),
                  ),
                ),
              ),
              10.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(16),
                        color: HexColor('#404345')),
                  ),
                  10.pw,
                  Text(
                    mobileno!,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w200,
                      fontSize: ScreenUtil().setSp(16),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
