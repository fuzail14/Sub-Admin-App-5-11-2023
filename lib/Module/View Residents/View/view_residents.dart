import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../Constants/constants.dart';
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
                          return SizedBox(
                            height: 630,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            elevation: 0,
                                            child: Container(
                                              width: 630,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ResidentDetailWidget(
                                                        heading: 'Name',
                                                        text: snapshot
                                                                .data![index]
                                                                .firstname +
                                                            " " +
                                                            snapshot
                                                                .data![index]
                                                                .lastname),
                                                    ResidentDetailWidget(
                                                        heading: 'Mobile No',
                                                        text: snapshot
                                                            .data![index]
                                                            .mobileno
                                                            .toString()),
                                                    ResidentDetailWidget(
                                                        heading: 'Address',
                                                        text: snapshot
                                                            .data![index]
                                                            .address),
                                                    ResidentDetailWidget(
                                                        heading:
                                                            'Residental Type',
                                                        text: snapshot
                                                            .data![index]
                                                            .residenttype),

                                                    ResidentDetailWidget(
                                                        heading:
                                                            'Property Type',
                                                        text: snapshot
                                                            .data![index]
                                                            .propertytype),

                                                    ResidentDetailWidget(
                                                        heading: 'Vehicle No',
                                                        text: snapshot
                                                            .data![index]
                                                            .vechileno),

                                                    ResidentDetailWidget(
                                                        heading: 'CNIC',
                                                        text: snapshot
                                                            .data![index]
                                                            .cnic) //VEHICLE NO
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        24, 16, 24, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/cardbackground.jpeg',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(17),
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
                                      height: 120,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 14, left: 8),
                                                  child: Container(
                                                    width: 70.4,
                                                    height: 64,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(Api
                                                                    .imageBaseUrl +
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .image
                                                                    .toString()),
                                                            fit: BoxFit.cover),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 18),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        snapshot.data![index]
                                                                .firstname
                                                                .toString() +
                                                            " " +
                                                            snapshot
                                                                .data![index]
                                                                .lastname
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 16,
                                                            color: HexColor(
                                                                '#404345')),
                                                      ),
                                                      Text(
                                                        snapshot.data![index]
                                                            .mobileno
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 16,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ]),
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.data!.length,
                            ),
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

class ResidentDetailWidget extends StatelessWidget {
  final String? heading;
  final String? text;

  const ResidentDetailWidget({required this.heading, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/ellipse_icon.svg'),
            SizedBox(
              width: 10,
            ),
            Text(
              heading!,
              style: GoogleFonts.montserrat(
                  color: HexColor('#1A1A1A'), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          children: [
            SizedBox(
              width: 30,
            ),
            Text(
              text!,
              style: GoogleFonts.montserrat(
                  color: HexColor('#262626'), fontWeight: FontWeight.w300),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );

  }
}
