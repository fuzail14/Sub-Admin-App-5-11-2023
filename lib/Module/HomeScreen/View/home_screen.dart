import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/HomeScreen/Controller/home_screen_controller.dart';
import 'package:societyadminapp/Module/HomeScreen/Widgets/admin_screen_custom_button.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

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
                  // decoration: BoxDecoration(
                  //     gradient: LinearGradient(colors: [
                  //   HexColor('#FB7712'),
                  //   HexColor('#FF9900'),
                  // ])),
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
                        // Padding(
                        //   padding: EdgeInsets.fromLTRB(
                        //       0,
                        //       MediaQuery.of(context).size.width * 0.06,
                        //       0,
                        //       0),
                        //   child:
                        //   // GestureDetector(
                        //   //   onTap: (){
                        //   //
                        //   //
                        //   //     Get.toNamed (viewheroimage ,arguments: [imageBaseUrl+controller.user.image!.toString(),
                        //   //       imageBaseUrl+controller.user.image!]);
                        //   //
                        //   //   },
                        //   //   child: Container(
                        //   //
                        //   //     width:
                        //   //     MediaQuery.of(context).size.width * 0.1,
                        //   //     height:
                        //   //     MediaQuery.of(context).size.width * 0.1,
                        //   //     decoration: BoxDecoration(
                        //   //         image: DecorationImage(fit: BoxFit.cover,
                        //   //
                        //   //             image:
                        //   //             NetworkImage(imageBaseUrl+controller.user.image!) ),
                        //   //         borderRadius: BorderRadius.circular(4),
                        //   //         border: Border.all(
                        //   //             color: HexColor('#ABABAB'))),
                        //   //
                        //   //   ),
                        //   // ),
                        // ),
                      ],
                    )),
                // UserAccountsDrawerHeader(
                //   decoration:BoxDecoration(color: primaryColor),
                //
                //   accountName: null,
                //   accountEmail: null,
                //   currentAccountPicture: CircleAvatar(
                //
                //     foregroundColor: primaryColor,
                //     backgroundColor: primaryColor,
                //     child: Text(
                //       "S",
                //       style: TextStyle(fontSize: 40.0),
                //     ),
                //   ),
                // ),
                // ListTile(
                //   leading: Icon(
                //     Icons.favorite_border_outlined,
                //     color: primaryColor,
                //   ),
                //   title: Text("User Report History"),
                //   onTap: () {
                //     // MySharedPreferences.deleteUserData();
                //     // Get.offAllNamed(login);
                //   },
                // ),
                // ListTile(
                //   leading: Icon(
                //     Icons.receipt_outlined,
                //     color: primaryColor,
                //   ),
                //   title: Text(
                //     "Guest Report History",
                //     style: GoogleFonts.ubuntu(
                //         color: HexColor('#565656'),
                //         fontWeight: FontWeight.w400,
                //         fontStyle: FontStyle.normal,
                //         letterSpacing: 1.2,
                //         fontSize: 12),
                //   ),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // ListTile(
                //   leading: Icon(
                //     Icons.person_outline_outlined,
                //     color: primaryColor,
                //   ),
                //   title: Text("Profile"),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),

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
                // ListTile(
                //   leading: Icon(
                //     Icons.logout,
                //     color: primaryColor,
                //   ),
                //   title: Text("test"),
                //   onTap: () {
                //     final HomeScreenController _homeScreenController = Get.put(HomeScreenController());
                //     _homeScreenController.countStream.sink.add(10);
                //   },
                // ),
                // Container(
                //     child: Align(
                //         alignment: FractionalOffset.bottomCenter,
                //         child: Column(
                //           children: <Widget>[
                //             Divider(),
                //             ListTile(
                //
                //                 title: Text('Settings')),
                //             ListTile(
                //
                //                 title: Text('Terms & Conditions \ Privacy')),
                //             ListTile(
                //
                //                 title: Text('Logout'))
                //           ],
                //         ))),
              ],
            ),
          ),
          backgroundColor: HexColor('#F5F5F5'),
          body: SingleChildScrollView(
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.038,
                    top: MediaQuery.of(context).size.width * 0.078),
                child: Row(
                  children: [
                    IconButton(
                        icon: SvgPicture.asset(
                          'assets/drawer.svg',
                        ),
                        onPressed: () {
                         _scaffoldKey.currentState!.openDrawer();
                        }),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.022),
                      child: Text(
                        'Society Admin',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: primaryColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.318),
                      child: IconButton(
                          icon: SvgPicture.asset(
                            'assets/bell.svg',
                          ),
                          onPressed: () {
                            Get.toNamed(reportnotificationsscreen,
                                arguments: controller.user);
                          }),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32, top: 32),
                    child: AdminScreenContainer(
                      onTap: () async {
                        Get.toNamed(viewuser, arguments: controller.user);
                      },
                      icon: 'assets/residents.svg',
                      text: 'Residents',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.020,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32, top: 32),
                    child: AdminScreenContainer(
                      onTap: () async {
                        Get.toNamed(gatekeeperscreen,
                            arguments: controller.user);
                      },
                      icon: 'assets/gatekeepers.svg',
                      text: 'Gatekeeper',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.016,
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 32, top: 32),
                      child: AdminScreenContainer(
                        onTap: () async {
                          Get.toNamed(eventsscreen, arguments: controller.user);
                        },
                        icon: 'assets/events.svg',
                        text: 'Events',
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 32, top: 32),
                      child: AdminScreenContainer(
                        onTap: () async {
                          Get.toNamed(noticeboardscreen,
                              arguments: controller.user);
                        },
                        icon: 'assets/noticeboard.svg',
                        text: 'NoticeBoard',
                      )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.016,
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 32, top: 32),
                      child: AdminScreenContainer(
                        onTap: () async {
                          Get.toNamed(viewreportscreen,
                              arguments: controller.user);
                        },
                        icon: 'assets/reports.svg',
                        text: 'Reports',
                      )),
                  (controller.user.structureType == 4)
                      ? Padding(
                      padding: EdgeInsets.only(left: 32, top: 32),
                      child: AdminScreenContainer(
                        onTap: () async {
                          Get.offAndToNamed(localbuildingscreen,
                              arguments: controller.user);
                        },
                        icon: 'assets/reports.svg',
                        text: 'Building Detail',
                      ))
                      : Padding(
                      padding: EdgeInsets.only(left: 32, top: 32),
                      child: AdminScreenContainer(
                        onTap: () async {
                          if (controller.user.structureType == 1) {
                            Get.offAndToNamed(streetorbuildingscreen,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 2) {
                            Get.offAndToNamed(blockorsocietybuilding,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 3) {
                            Get.offAndToNamed(phaseorsocietybuilding,
                                arguments: controller.user);
                          } else if (controller.user.structureType == 5) {
                            Get.offAndToNamed(structureType5HouseOrBuildingMiddlewareScreen,
                                arguments: controller.user);
                          }
                        },
                        icon: 'assets/reports.svg',
                        text: 'Society Details',
                      )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.016,
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 32, top: 32),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AdminScreenContainer(
                            onTap: () async {
                              Get.toNamed(unverifiedresident,
                                  arguments: controller.user);
                            },
                            icon: 'assets/reports.svg',
                            text: 'Resident\nVerification',
                          ),

                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 32, top: 32),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AdminScreenContainer(
                            onTap: () async {
                              Get.toNamed(measurementview,
                                  arguments: controller.user);
                            },
                            icon: 'assets/property_measurements.svg',
                            text: 'Measurements',
                          ),

                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 32, top: 32),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AdminScreenContainer(
                            onTap: () async {
                              Get.toNamed(generatedbill,
                                  arguments: controller.user);
                            },
                            icon: 'assets/reports.svg',
                            text: 'Bills',
                          ),

                        ],
                      )),
                  // Padding(
                  //     padding: EdgeInsets.only(left: 32, top: 32),
                  //     child: Stack(
                  //       clipBehavior: Clip.none,
                  //       children: [
                  //         AdminScreenContainer(
                  //           onTap: () async {
                  //             Get.toNamed(generatedbill,
                  //                 arguments: controller.user);
                  //           },
                  //           icon: 'assets/reports.svg',
                  //           text: 'Bills',
                  //         ),
                  //
                  //       ],
                  //     )),

                ],
              ),

              //             DropdownSearch<PhasesList>(
              //               asyncItems: (String filter) async {
              //                 print(filter);
              // print(_homeScreenController.user.bearerToken);
              //                 var response = await Dio().get(Api.phases + "/" + 1.toString(),
              //                     options: Options(headers: {
              //                       "Content-Type": "application/json",
              //                       "Authorization":
              //                           "Bearer 5|Yh7SaShpAoohHRhkAWKeigU0uNhXp5icrlOzLbVX"
              //                     }));
              //                 var data = response.data['data'];
              //                 List<PhasesList> p = [];
              //
              //                 p = (data as List)
              //                     .map((e) => PhasesList(
              //                         id: e['id'],
              //                         name: e['name'],
              //                         subadminid: e['subadminid']))
              //                     .toList();
              //
              //                 return p;
              //               },
              //               onChanged: (PhasesList? data) {
              //                 _homeScreenController.selectedItem = data;
              //               },
              //               selectedItem: _homeScreenController.selectedItem,
              //               itemAsString: (PhasesList p) {
              //                 return p.name.toString()!;
              //               },
              //             ),
            ]),
          ),
        ),
      ),
    );
  }
}