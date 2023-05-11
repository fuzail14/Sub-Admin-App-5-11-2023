import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/NoticeBoard/Controller/notice_board_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Dialog Box/my_dialog_box.dart';

class NoticeBoardScreen extends GetView {
  NoticeBoardController noticeBoardController =
      Get.put(NoticeBoardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoticeBoardController>(
      init: NoticeBoardController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
            floatingActionButton: IconButton(
                padding: EdgeInsets.only(top: 85),
                iconSize: MediaQuery.of(context).size.height * 0.065,
                icon: SvgPicture.asset('assets/floatingbutton.svg'),
                onPressed: () {
                  Get.offAndToNamed(addnoticeboardscreen,
                      arguments: controller.user);
                }),

            backgroundColor: Colors.white,
            body: Column(
              children: [
                MyBackButton(
                  text: 'NoticeBoard',
                ),


                Expanded(
                  child: FutureBuilder(
                      future: controller.data,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data != null && snapshot.data!.length != 0) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
                              child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          24, 16, 24, 0),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 20, 0, 0),
                                              child: Text(
                                                snapshot.data![index].noticetitle
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.ubuntu(
                                                    color: HexColor('#404345'),
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: 0.0015,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 40, 0, 0),
                                              child: Text(
                                                snapshot.data![index].noticedetail
                                                    .toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    color: HexColor("#AAAAAA"),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  278, 60, 0, 0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    color: primaryColor),
                                                child: IconButton(
                                                  icon: SvgPicture.asset(
                                                      "assets/delete_noticboard_icon.svg",
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width),
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return CustomDialog(
                                                            image: SvgPicture.asset(
                                                                "assets/showdialog_delete_icon.svg",
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.06),
                                                            negativeBtnPressed:
                                                                () {
                                                              Get.back();
                                                            },
                                                            title:
                                                                "Are you sure !",
                                                            content:
                                                                "Do you want to delete this?",
                                                            positiveBtnText:
                                                                "Delete",
                                                            negativeBtnText:
                                                                "Cancel",
                                                            positiveBtnPressed:
                                                                () {
                                                              controller
                                                                      .currentNoticeBoardId =
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .id;

                                                              controller.deleteNoticeBoardApi(
                                                                  controller
                                                                      .currentNoticeBoardId,
                                                                  controller
                                                                      .userdata
                                                                      .bearerToken!);
                                                            },
                                                          );
                                                        });
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  318, 60, 0, 0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    color: primaryColor),
                                                child: IconButton(
                                                  icon: SvgPicture.asset(
                                                      "assets/edit_icon.svg",
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width),
                                                  onPressed: () {



                                                    Get.toNamed(

                                                        updatenoticeboardscreen,arguments: [
                                                      snapshot.data![index],
                                                      controller.user

                                                    ]
                                                       );

                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 120, 10, 10),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(7),
                                                    color: HexColor('#F2F2F2')
                                                    // gradient: LinearGradient(
                                                    //   // 10% of the width, so there are ten blinds.
                                                    //   colors: <Color>[
                                                    //     HexColor('#FF9900'),
                                                    //     HexColor('#FB7712'),
                                                    //   ], // red to yellow
                                                    //   // tileMode: TileMode.repeated, // repeats the gradient over the canvas
                                                    // ),

                                                    ),
                                                child: Stack(
                                                  children: [
                                                    // Align(
                                                    //     alignment:
                                                    //         Alignment.centerLeft,
                                                    //     child: Padding(
                                                    //       padding:
                                                    //           const EdgeInsets
                                                    //                   .fromLTRB(
                                                    //               10, 0, 0, 0),
                                                    //       child: SvgPicture.asset(
                                                    //         "assets/noticeboard_date_icon.svg",
                                                    //         // width: 20,
                                                    //         // color: primaryColor,
                                                    //         color: primaryColor,
                                                    //       ),
                                                    //     )),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                                .fromLTRB(
                                                            40, 0, 0, 0),
                                                        child: Text(
                                                          snapshot.data![index]
                                                              .startdate
                                                              .toString(),
                                                          style:
                                                              GoogleFonts.ubuntu(
                                                            color: primaryColor,
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            letterSpacing: 0.0015,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 80, 0),
                                                        child: SvgPicture.asset(
                                                          "assets/time_icon.svg",
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: Text(
                                                          snapshot.data![index]
                                                              .endtime
                                                              .toString(),
                                                          style:
                                                              GoogleFonts.ubuntu(
                                                            color: primaryColor,
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            letterSpacing: 0.0015,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: snapshot.data!.length),
                            );
                          } else {
                            return Center(
                                child: Text(
                              'No Notices',
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
            )),
      ),
    );
  }
}
