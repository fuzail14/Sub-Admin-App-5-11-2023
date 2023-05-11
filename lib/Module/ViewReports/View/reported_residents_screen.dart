import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../Controller/reported_resident_controller.dart';
import '../Model/ReportedResident.dart';

class ReportedResidentListScreen extends StatelessWidget {
  final ResidentsListController usersReportListController =
  Get.put(ResidentsListController());

  @override
  Widget build(BuildContext context) {
    print("build");
    return GetBuilder<ResidentsListController>(

      init: ResidentsListController(),
      builder: (controller) => SafeArea(
        child: SafeArea(
          child: Scaffold(backgroundColor: Colors.white,

            body: Column(
              children: [
                MyBackButton(text: 'Reported Residents',),
                Expanded(
                  child: FutureBuilder<List<ReportedResident>>(
                      future: controller.viewResidentsApi(
                          controller.userdata.userid!, controller.userdata.bearerToken!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data != null && snapshot.data!.length != 0) {

                            return
                              ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(width: 400,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                      ),
                                      child: Container(width: 400,
                                        // color: Colors.red,
                                        child: Stack(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(width: MediaQuery.of(context).size.width*0.2,height:MediaQuery.of(context).size.height*0.1,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                image: DecorationImage(
                                              fit: BoxFit.contain,

                                            image: NetworkImage(Api.imageBaseUrl+snapshot.data![index].image.toString())
                                          )),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.26, MediaQuery.of(context).size.width*0.03, MediaQuery.of(context).size.width*0.03, 0),
                                          child: Column(
                                            children: [
                                              Text(snapshot.data![index].firstname.toString()+' '+snapshot.data![index].lastname.toString(),
                                                maxLines: 1,

                                                style: GoogleFonts.ubuntu(
                                                  color:
                                                  HexColor('#404345'),
                                                  fontStyle:
                                                  FontStyle.normal,
                                                  letterSpacing: 0.0015,
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.w500),),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.26,
                                            MediaQuery.of(context).size.width*0.09, MediaQuery.of(context).size.width*0.42, 0),
                                          child: Column(
                                            children: [
                                              Text(snapshot.data![index].address.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,style:
                                              GoogleFonts.ubuntu(
                                                  color:
                                                  HexColor('#AAAAAA'),
                                                  fontStyle:
                                                  FontStyle.normal,
                                                  letterSpacing: 0.0015,
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w500) ,),
                                            ],
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.26, MediaQuery.of(context).size.width*0.18
                                            , MediaQuery.of(context).size.width*0.10, 0), child: Column(
                                            children: [
                                              Text("0343570946",style:     GoogleFonts.ubuntu(
                                                  color:
                                                  HexColor('#AAAAAA'),
                                                  fontStyle:
                                                  FontStyle.normal,
                                                  letterSpacing: 0.0015,
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w400) ,),
                                            ],
                                          ),),
                                          Padding(padding: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width*0.6,
                                              MediaQuery.of(context).size.width*0.10,
                                              MediaQuery.of(context).size.width*0.03,
                                              0), child:
                                          MyButton(name: 'Reports',color: primaryColor,width: MediaQuery.of(context).size.width*0.3,fontWeight: FontWeight.w400,letterSpacing: 1.2,

                                            onPressed: (){
                                              Get.toNamed(userreportslistscreen, arguments: [
                                                controller.user,
                                                snapshot.data![index].userid,
                                                snapshot.data![index].firstname,
                                                snapshot.data![index].lastname,
                                                snapshot.data![index].address,
                                                snapshot.data![index].mobileno,

                                              ]);
                                            },

                                          ),),


                                        ],),)

                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.data!.length,
                            );
                          } else {
                            return   Center(child: Text('No Reports',style: GoogleFonts.ubuntu(
                                color:
                                HexColor('#404345'),
                                fontStyle:
                                FontStyle.normal,
                                letterSpacing: 0.0015,
                                fontSize: 16,
                                fontWeight:
                                FontWeight.w500)));;
                          }
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return Center(child: CircularProgressIndicator(color: primaryColor,));
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
