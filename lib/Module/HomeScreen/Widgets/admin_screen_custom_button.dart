import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Constants/constants.dart';
// ignore: must_be_immutable
class AdminScreenContainer extends StatelessWidget {
  AdminScreenContainer(
      {required this.onTap, required this.icon, required this.text});
  void Function()? onTap;
  String? icon;
  String? text;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.090, //51
        width: MediaQuery.of(context).size.width * 0.348,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: primaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.032,
                  top: MediaQuery.of(context).size.height * 0.016),
              child: Container(
                child:  SvgPicture.asset(
                    icon!,
                    fit: BoxFit.scaleDown,
                    // width: MediaQuery.of(
                    //     context)
                    //     .size
                    //     .width*0.01
                    //
                ),
                width: MediaQuery.of(context).size.width * 0.080,
                height: MediaQuery.of(context).size.height * 0.040,
                decoration: BoxDecoration(

                  color: HexColor('#FFDDA9'),
                  borderRadius: BorderRadius.circular(12),

                  // image: DecorationImage(
                  //     image: AssetImage(
                  //       icon!,
                  //     ),
                  //     colorFilter: ColorFilter.mode(
                  //         HexColor('#F7991A'), BlendMode.dstIn)
                  //
                  // ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.028,
                top: MediaQuery.of(context).size.height * 0.030,
              ),
              child: Text(
                text!,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.030, //16
                    fontFamily: "OpenSansSemiBold",
                    color: HexColor('#FFFFFF'),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
