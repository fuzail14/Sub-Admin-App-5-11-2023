import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Controller/unverified_resident_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Empty%20List/empty_list.dart';
import 'package:societyadminapp/Widgets/Loader/loader.dart';
import '../../../Constants/api_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../Widget/unverified_resident_custom_widget.dart';

class UnVerifiedResident extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UnVerifiedResidentController>(
      init: UnVerifiedResidentController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: HexColor('#F5F5F5'),
          body: Column(
            children: [
              MyBackButton(
                text: 'UnVerified Residents',
              ),
              // MyText(name: 'House Residents'),
              SizedBox(
                height: 20,
              ),

              (controller.userdata.structureType == 4)
                  ? Expanded(
                      child: FutureBuilder(
                          future: controller.viewUnVerifiedLocalBuildingApartmentResidentApi(
                                  subadminid: controller.userdata.userid!,
                                  token: controller.userdata.bearerToken!,
                                  status: 0),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.data != null &&
                                  snapshot.data.data!.length != 0) {
                                return SizedBox(
                                  height: 630,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      print(snapshot
                                          .data.data[index].runtimeType);

                                      return UnverifiedCard(
                                        onTap: () {
                                          Get.offNamed(
                                              localBuildingApartmentResidentVerification,
                                              arguments: [
                                                controller.userdata,
                                                snapshot.data.data[index]
                                              ]);
                                        },
                                        imgUrl: Api.imageBaseUrl +
                                            snapshot.data.data[index].image
                                                .toString(),
                                        name: snapshot
                                                .data.data[index].firstname
                                                .toString() +
                                            ' ' +
                                            snapshot.data.data[index].lastname
                                                .toString(),
                                        mobileno: snapshot
                                            .data.data[index].mobileno
                                            .toString(),
                                      );
                                    },
                                    itemCount: snapshot.data.data.length,
                                  ),
                                );
                              } else {
                                return EmptyList(name: 'No Resident for Verification',);
                              }
                            } else if (snapshot.hasError) {
                              return Icon(Icons.error_outline);
                            } else {
                              return Loader();
                            }
                          }),
                    )
                  : Expanded(
                child: FutureBuilder(
                    future: controller.viewUnVerifiedResidentApi(
                        subadminid: controller.userdata.userid!,
                        token: controller.userdata.bearerToken!,
                        status: 0),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.data != null &&
                            snapshot.data.data!.length != 0) {
                          return SizedBox(
                            height: 630,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                print(snapshot
                                    .data.data[index].runtimeType);

                                return UnverifiedCard(
                                  onTap: () {
                                    Get.offNamed(
                                        houseresidentverification,
                                        arguments: [
                                          controller.userdata,
                                          snapshot.data.data[index]
                                        ]);
                                  },
                                  imgUrl:Api. imageBaseUrl +
                                      snapshot.data.data[index].image
                                          .toString(),
                                  name: snapshot
                                      .data.data[index].firstname
                                      .toString() +
                                      ' ' +
                                      snapshot
                                          .data.data[index].lastname
                                          .toString(),
                                  mobileno: snapshot
                                      .data.data[index].mobileno
                                      .toString(),
                                );
                              },
                              itemCount: snapshot.data.data.length,
                            ),
                          );
                        } else {
                          return Container();
                        }
                      } else if (snapshot.hasError) {
                        return Icon(Icons.error_outline);
                      } else {
                        return Loader();
                      }
                    }),
              ),
                    Expanded(
                child: FutureBuilder(
                    future:
                    controller.viewUnVerifiedApartmentResidentApi(
                        subadminid: controller.userdata.userid!,
                        token: controller.userdata.bearerToken!,
                        status: 0),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.data != null &&
                            snapshot.data.data!.length != 0) {
                          return SizedBox(
                            height: 630,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                print(snapshot
                                    .data.data[index].runtimeType);

                                return UnverifiedCard(
                                    onTap: () {
                                      Get.offNamed(
                                          apartmentresidentverification,
                                          arguments: [
                                            controller.userdata,
                                            snapshot.data.data[index]
                                          ]);
                                    },
                                    imgUrl: Api.imageBaseUrl +
                                        snapshot
                                            .data.data[index].image
                                            .toString(),
                                    name: snapshot.data.data[index]
                                        .firstname
                                        .toString() +
                                        ' ' +
                                        snapshot
                                            .data.data[index].lastname
                                            .toString(),
                                    mobileno: snapshot
                                        .data.data[index].mobileno
                                        .toString());
                              },
                              itemCount: snapshot.data.data.length,
                            ),
                          );
                        } else {
                          return Container();
                        }
                      } else if (snapshot.hasError) {
                        return Icon(Icons.error_outline);
                      } else {
                        return Loader();
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
