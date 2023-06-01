import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/DetailShownDialogBox/Detail_shown_dialog_box.dart';
import '../Controller/view_residents_controller.dart';

class ViewResidents extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewResidentController>(
      init: ViewResidentController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: HexColor('#F5F5F5'),
          body: Column(
            children: [
              MyBackButton(
                text: 'Residents',
              ),
              Expanded(
                child: FutureBuilder(
                    future: controller.viewResidentsApi(
                        controller.userdata.userid!,
                        controller.userdata.bearerToken!),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null &&
                            snapshot.data!.length != 0) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          insetAnimationCurve:
                                              Curves.easeInOutCubicEmphasized,
                                          insetAnimationDuration:
                                              Duration(seconds: 3),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: SizedBox(
                                            height: ScreenUtil().setHeight(400),
                                            child: Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Column(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        snapshot.data![index]
                                                                .firstname +
                                                            " " +
                                                            snapshot
                                                                .data![index]
                                                                .lastname,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: HexColor(
                                                              '#4D4D4D'),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: ScreenUtil()
                                                              .setSp(18),
                                                        ),
                                                      ),
                                                      10.ph,
                                                      Text(
                                                        snapshot.data![index]
                                                            .mobileno,
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#1A1A1A'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            16)),
                                                      ),
                                                    ],
                                                  ),
                                                  20.ph,
                                                  DetailShownDialogBox(
                                                      icon:
                                                          'assets/contactsvg.svg',
                                                      heading: 'Mobile No',
                                                      text: snapshot
                                                          .data![index].mobileno
                                                          .toString()),
                                                  DetailShownDialogBox(
                                                      icon:
                                                          'assets/addresssvg.svg',
                                                      heading: 'Address',
                                                      text: snapshot
                                                          .data![index]
                                                          .address),
                                                  DetailShownDialogBox(
                                                      icon:
                                                          'assets/cnicsvg.svg',
                                                      heading:
                                                          'Residental Type',
                                                      text: snapshot
                                                          .data![index]
                                                          .residenttype),
                                                  DetailShownDialogBox(
                                                      icon:
                                                          'assets/cnicsvg.svg',
                                                      heading: 'Property Type',
                                                      text: snapshot
                                                          .data![index]
                                                          .propertytype),
                                                  DetailShownDialogBox(
                                                      icon: 'assets/carsvg.svg',
                                                      heading: 'Vehicle No',
                                                      text: snapshot
                                                          .data![index]
                                                          .vechileno),
                                                  DetailShownDialogBox(
                                                      icon:
                                                          'assets/cnicsvg.svg',
                                                      heading: 'CNIC',
                                                      text: snapshot
                                                          .data![index].cnic),
                                                  // if (snapshot.data![index]
                                                  //         .residenttype ==
                                                  //     'Rental') ...[
                                                  //   ListView.builder(
                                                  //     shrinkWrap: true,
                                                  //     physics:
                                                  //         NeverScrollableScrollPhysics(),
                                                  //     itemCount: snapshot
                                                  //         .data.owner.length,
                                                  //     itemBuilder:
                                                  //         (context, resIndex) {
                                                  //       return Row(
                                                  //         children: [
                                                  //           Expanded(
                                                  //             child: ListView
                                                  //                 .builder(
                                                  //               shrinkWrap:
                                                  //                   true,
                                                  //               physics:
                                                  //                   NeverScrollableScrollPhysics(),
                                                  //               itemCount:
                                                  //                   snapshot
                                                  //                       .data[
                                                  //                           index]
                                                  //                       .owner
                                                  //                       .length,
                                                  //               itemBuilder:
                                                  //                   (context,
                                                  //                       resTableIndex) {
                                                  //                 return Column(
                                                  //                   children: [
                                                  //                     Text(
                                                  //                       'Owner Detail',
                                                  //                       style: GoogleFonts
                                                  //                           .montserrat(
                                                  //                         color:
                                                  //                             HexColor('#4D4D4D'),
                                                  //                         fontWeight:
                                                  //                             FontWeight.w700,
                                                  //                         fontSize:
                                                  //                             ScreenUtil().setSp(18),
                                                  //                       ),
                                                  //                     ),
                                                  //                     10.ph,
                                                  //                     DetailShownDialogBox(
                                                  //                         icon:
                                                  //                             'assets/contactsvg.svg',
                                                  //                         heading:
                                                  //                             'Owner Name',
                                                  //                         text: snapshot
                                                  //                             .data![index]
                                                  //                             .ownername
                                                  //                             .toString()),
                                                  //                     DetailShownDialogBox(
                                                  //                         icon:
                                                  //                             'assets/contactsvg.svg',
                                                  //                         heading:
                                                  //                             'Owner Mobile No',
                                                  //                         text: snapshot
                                                  //                             .data![index]
                                                  //                             .ownermobileno
                                                  //                             .toString()),
                                                  //                     DetailShownDialogBox(
                                                  //                         icon:
                                                  //                             'assets/contactsvg.svg',
                                                  //                         heading:
                                                  //                             'Owner Address',
                                                  //                         text: snapshot
                                                  //                             .data![index]
                                                  //                             .owneraddress
                                                  //                             .toString())
                                                  //                   ],
                                                  //                 );
                                                  //               },
                                                  //             ),
                                                  //           ),
                                                  //         ],
                                                  //       );
                                                  //     },
                                                  //   ),
                                                  // ]
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(24),
                                    right: ScreenUtil().setWidth(24),
                                    top: ScreenUtil().setWidth(32),
                                  ),
                                  child: Container(
                                    width: ScreenUtil().setWidth(327),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/cardbackground.jpeg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              189, 224, 224, 223),
                                          spreadRadius: 5,

                                          blurRadius: 9,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      color: HexColor('#FFFFFF'),
                                    ),
                                    height: ScreenUtil().setHeight(88),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: ScreenUtil()
                                                        .setWidth(14.4),
                                                    left: ScreenUtil()
                                                        .setHeight(4)),
                                                child: Container(
                                                  width: ScreenUtil()
                                                      .setWidth(90.4),
                                                  height: ScreenUtil()
                                                      .setHeight(61.6),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(Api
                                                                .imageBaseUrl +
                                                            snapshot
                                                                .data![index]
                                                                .image
                                                                .toString()),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                              ),
                                              10.pw,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data![index]
                                                            .firstname
                                                            .toString() +
                                                        " " +
                                                        snapshot.data![index]
                                                            .lastname
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        color: HexColor(
                                                            '#404345')),
                                                  ),
                                                  10.pw,
                                                  Text(
                                                    snapshot
                                                        .data![index].mobileno
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      fontSize: 16,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ),
                                ),
                              );
                            },
                            itemCount: snapshot.data!.length,
                          );
                        } else {
                          return Center(
                              child: Text(
                            'No Residents',
                            style: GoogleFonts.ubuntu(
                                color: HexColor('#404345'),
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.0015,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ));
                        }
                      } else if (snapshot.hasError) {
                        return Icon(Icons.error_outline);
                      } else {
                        return Center(
                            child: CircularProgressIndicator(
                          color: primaryColor,
                        ));
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
