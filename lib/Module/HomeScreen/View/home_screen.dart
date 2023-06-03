import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/HomeScreen/Controller/home_screen_controller.dart';
import 'package:societyadminapp/Module/HomeScreen/Widgets/admin_screen_custom_button.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Extensions/extensions.dart';

import '../../../Constants/constants.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../Widgets/UpIcon/up_icon.dart';

class HomeScreen extends GetView {
  // final HomeScreenController _homeScreenController =
  //     Get.put(HomeScreenController());
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    child: Column(
                  children: [
                    Text(
                      controller.user.firstName! +
                          " " +
                          controller.user.lastName!,
                      style: GoogleFonts.inriaSerif(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: HexColor('#FF9900')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Center(
                          child: SvgPicture.asset('assets/splashsvg.svg')),
                    )
                  ],
                )),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: primaryColor,
                  ),
                  title: Text("Logout"),
                  onTap: () {
                    MySharedPreferences.deleteUserData();
                    Get.offAllNamed(login);
                  },
                ),
              ],
            ),
          ),
          backgroundColor: HexColor('#F5F5F5'),
          body: SingleChildScrollView(
            child: Column(children: [
              // drawer title n bell
              Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(35),
                    top: ScreenUtil().setHeight(72)),
                child: Row(
                  children: [
                    IconButton(
                        icon: SvgPicture.asset(
                          'assets/drawer.svg',
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        }),
                    16.pw,
                    Text(
                      'Society Admin',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: primaryColor),
                    ),
                    80.61.pw,
                    IconButton(
                        icon: SvgPicture.asset(
                          'assets/bell.svg',
                        ),
                        onPressed: () {
                          Get.toNamed(reportnotificationsscreen,
                              arguments: controller.user);
                        }),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(30),
                  top: ScreenUtil().setHeight(32),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AdminScreenContainer(
                          onTap: () async {
                            Get.toNamed(viewuser, arguments: controller.user);
                          },
                          icon: 'assets/residents.svg',
                          text: 'Residents',
                        ),
                        19.pw,
                        AdminScreenContainer(
                          onTap: () async {
                            Get.toNamed(gatekeeperscreen,
                                arguments: controller.user);
                          },
                          icon: 'assets/gatekeepers.svg',
                          text: 'Gatekeeper',
                        ),
                      ],
                    ),
                    16.ph,
                    Row(
                      children: [
                        AdminScreenContainer(
                          onTap: () async {
                            Get.toNamed(eventsscreen,
                                arguments: controller.user);
                          },
                          icon: 'assets/events.svg',
                          text: 'Events',
                        ),
                        19.pw,
                        AdminScreenContainer(
                          onTap: () async {
                            Get.toNamed(noticeboardscreen,
                                arguments: controller.user);
                          },
                          icon: 'assets/noticeboard.svg',
                          text: 'NoticeBoard',
                        ),
                      ],
                    ),
                    16.ph,
                    Row(
                      children: [
                        AdminScreenContainer(
                          onTap: () async {
                            Get.toNamed(viewreportscreen,
                                arguments: controller.user);
                          },
                          icon: 'assets/reports.svg',
                          text: 'Reports',
                        ),
                        19.pw,
                        (controller.user.structureType == 4)
                            ? AdminScreenContainer(
                                onTap: () async {
                                  Get.offAndToNamed(localbuildingscreen,
                                      arguments: controller.user);
                                },
                                icon: 'assets/reports.svg',
                                text: 'Building\nDetail',
                              )
                            : AdminScreenContainer(
                                onTap: () async {
                                  if (controller.user.structureType == 1) {
                                    Get.offAndToNamed(streetorbuildingscreen,
                                        arguments: controller.user);
                                  } else if (controller.user.structureType ==
                                      2) {
                                    Get.offAndToNamed(blockorsocietybuilding,
                                        arguments: controller.user);
                                  } else if (controller.user.structureType ==
                                      3) {
                                    Get.offAndToNamed(phaseorsocietybuilding,
                                        arguments: controller.user);
                                  } else if (controller.user.structureType ==
                                      5) {
                                    Get.offAndToNamed(
                                        structureType5HouseOrBuildingMiddlewareScreen,
                                        arguments: controller.user);
                                  }
                                },
                                icon: 'assets/reports.svg',
                                text: 'Society\nDetail',
                              ),
                      ],
                    ),
                    16.ph,
                    Row(
                      children: [
                        AdminScreenContainer(
                          onTap: () async {
                            Get.toNamed(unverifiedresident,
                                arguments: controller.user);
                          },
                          icon: 'assets/reports.svg',
                          text: 'Resident\nVerification',
                        ),
                        19.pw,
                        AdminScreenContainer(
                          onTap: () async {
                            Get.toNamed(measurementview,
                                arguments: controller.user);
                          },
                          icon: 'assets/reports.svg',
                          text: 'Measurement',
                        ),
                      ],
                    ),
                    16.ph,
                    Row(
                      children: [
                        AdminScreenContainer(
                          onTap: () async {
                            Get.offNamed(bills, arguments: controller.user);
                          },
                          icon: 'assets/reports.svg',
                          text: 'Bills',
                        ),
                        19.pw,
                        AdminScreenContainer(
                          onTap: () async {
                            Get.toNamed(residentialEmergencyScreen,
                                arguments: controller.user);
                          },
                          icon: 'assets/reports.svg',
                          text: 'Residential\nEmergency',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              50.ph,
              UpIcon(),
            ]),
          ),
        ),
      ),
    );
  }
}
