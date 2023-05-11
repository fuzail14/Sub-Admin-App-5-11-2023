import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/Events/Controller/event_screen_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Dialog Box/my_dialog_box.dart';

class EventsScreen extends StatefulWidget {
  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventScreenController>(
      init: EventScreenController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(backgroundColor: Colors.white,
            floatingActionButton: IconButton(
                padding: EdgeInsets.only(top: 85),
                iconSize: MediaQuery.of(context).size.height * 0.065,
                icon: SvgPicture.asset('assets/floatingbutton.svg'),
                onPressed: () {
                  Get.offAndToNamed(addeventsscreen,
                      arguments: controller.user);
                }),


            body: GetBuilder<EventScreenController>(
                init: EventScreenController(),
                builder: (controller) {
                  return Column(
                    children: [
                      MyBackButton(text: 'Events',widget:  Padding(
                        padding: const EdgeInsets.only(left: 142),
                        child: DropdownButton(
                          // enableFeedback: true,
                          isExpanded: false,
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: HexColor('#4D4D4D')),
                          value: controller. eventVal,
                          icon: Icon(
                            Icons.filter_list,
                            color: primaryColor,
                          ),
                          items: controller.eventDropDownList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.setEventVal(newValue);
                            controller.data=   controller.searchEventsApi(userid: controller.userdata.userid!
                                ,token: controller.userdata.bearerToken!,
                                query: controller.eventVal);

                          },
                        ),
                      ),),


                      Expanded(
                        child: FutureBuilder(
                            future: controller.data,
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                         if (snapshot.data != null && snapshot.data.data.length!=0) {


                                return controller.isSearch?Center(child: CircularProgressIndicator(color: primaryColor,)) :Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
                                    child: ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 200,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: SvgPicture.asset(
                                                        "assets/event_card_design.svg",
                                                        color: primaryColor,
                                                      )),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        20, 20, 0, 0),
                                                    child: Text(
                                                      snapshot.data.data[index].title.toString(),
                                                      textAlign: TextAlign.center,
                                                      style: GoogleFonts.ubuntu(
                                                          color:
                                                              HexColor('#404345'),
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          letterSpacing: 0.0015,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        20, 40, 0, 0),
                                                    child: Text(
                                                      snapshot.data.data[index].description,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.center,
                                                      style: GoogleFonts.ubuntu(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color:
                                                              HexColor("#AAAAAA"),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        20, 70, 0, 0),
                                                    child: MyButton(
                                                     outlinedBorder:RoundedRectangleBorder(
                                                       borderRadius: BorderRadius.circular(8)) ,
                                                      width: MediaQuery.of(context).size.width*0.23,
                                                      textColor: primaryColor,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 10,
                                                      height: MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.03,

                                                      name: 'Add Image',
                                                      color: HexColor('#E8E8E8'),
                                                      elevation: 0,
                                                      onPressed: () {
                                                        controller.selectImages();
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        130, 70, 0, 0),
                                                    child: MyButton(

elevation: 0,
                                                      textColor: Colors.white,
                                                      fontWeight: FontWeight.w500,
                                                      width: MediaQuery.of(context).size.width*0.23,
                                                      height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                          0.03,
                                                      outlinedBorder:RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(8)) ,
                                                      fontSize: 10,
                                                      name: 'View Image',
                                                      color: primaryColor,
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        280, 60, 0, 0),
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
                                                              BorderRadius.circular(
                                                                  10),
                                                          color: primaryColor),
                                                      child: IconButton(
                                                        icon: SvgPicture.asset(
                                                            "assets/delete_noticboard_icon.svg",
                                                            width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width),
                                                        onPressed: () {
                                                          showDialog(
                                                              context:
                                                              context,
                                                              builder:
                                                                  (context) {
                                                                return CustomDialog(
                                                                  image:SvgPicture.asset(
                                                                      "assets/showdialog_delete_icon.svg",
                                                                      width: MediaQuery.of(
                                                                          context)
                                                                          .size
                                                                          .width*0.06),
                                                                  negativeBtnPressed: () {
                                                                    Get.back();
                                                                  },
                                                                  title: "Are you sure !",
                                                                  content: "Do you want to delete this?",
                                                                  positiveBtnText: "Delete",
                                                                  negativeBtnText: "Cancel",
                                                                  positiveBtnPressed: () {
                                                                    controller.deleteEventApi( snapshot.data.data[index].id, controller.userdata.bearerToken!);

                                                                  },
                                                                );
                                                              });

                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        320, 60, 0, 0),
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
                                                              BorderRadius.circular(
                                                                  10),
                                                          color: primaryColor),
                                                      child: IconButton(
                                                        icon: SvgPicture.asset(
                                                            "assets/edit_icon.svg",
                                                            width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width),
                                                        onPressed: () {
                                                          Get.offAndToNamed(updateevent,arguments: snapshot.data.data[index]);

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
                                                            BorderRadius.circular(
                                                                7),
                                                        // color: primaryColor
                                                        gradient: LinearGradient(
                                                          // 10% of the width, so there are ten blinds.
                                                          colors: <Color>[
                                                            HexColor('#FF9900'),
                                                            HexColor('#FB7712'),
                                                          ], // red to yellow
                                                          // tileMode: TileMode.repeated, // repeats the gradient over the canvas
                                                        ),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child: SvgPicture
                                                                    .asset(
                                                                  "assets/event_icon.svg",
                                                                  width: 20,
                                                                ),
                                                              )),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      40, 0, 0, 0),
                                                              child: Text(
                                                                snapshot.data.data[index].startdate.toString(),
                                                                style: GoogleFonts
                                                                    .ubuntu(
                                                                  color: HexColor(
                                                                      '#FFFFFF'),
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  letterSpacing:
                                                                      0.0015,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Center(
                                                              child:
                                                                  SvgPicture.asset(
                                                            "assets/event_arrow.svg",
                                                          )),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(
                                                                      0, 0, 10, 0),
                                                              child: Text(
                                                                snapshot.data.data[index].enddate.toString(),
                                                                style: GoogleFonts
                                                                    .ubuntu(
                                                                  color: HexColor(
                                                                      '#FFFFFF'),
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  letterSpacing:
                                                                      0.0015,
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
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color.fromRGBO(
                                                        187, 187, 187, 0.3)),
                                                // color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: snapshot.data.data.length),
                                  ),
                                );}
          else{
            return
              Center(child: Text('No Events',style: GoogleFonts.ubuntu(
                color:
                HexColor('#404345'),
                fontStyle:
                FontStyle.normal,
                letterSpacing: 0.0015,
                fontSize: 16,
                fontWeight:
                FontWeight.w500),
            ));
          }
                              } else if (snapshot.hasError) {
                                return Icon(Icons.error_outline);
                              } else {
                                return Center(child: CircularProgressIndicator(color: primaryColor,));
                              }
                            }),
                      ),
                    ],
                  );
                }),
          ),
        );
      }
    );
  }
}

