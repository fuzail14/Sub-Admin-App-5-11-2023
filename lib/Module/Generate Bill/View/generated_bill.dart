import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Widgets/Loader/loader.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../Controller/generated_bill_controller.dart';

class GeneratedBill extends StatelessWidget {
  const GeneratedBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<GeneratedBillController>(
          init: GeneratedBillController(),
          builder: (controller) {
            return WillPopScope(
              onWillPop: ()async{

                await  Get.offNamed(homescreen,arguments: controller.user);

                return true;
              },
              child: Scaffold(
                  body: Column(
                    children: [
                      MyBackButton(text: 'Generated Bill',onTap: (){

                        Get.offNamed(homescreen,arguments: controller.user);
                      },),
                      SizedBox(height: 20,),
                      Expanded(
                        child: FutureBuilder(

                            future: controller.generatedBillApi(
                                controller.user!.userid!,
                                controller.user.bearerToken!),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {


                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DataTable(

                                      dataRowHeight: 40,
                                      columnSpacing: 10,
                                      // dataTextStyle: TextStyle(fontSize: 14,color: Colors.black),
                                      border: TableBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                      columns: [
                                        DataColumn(label: Text('Name')),
                                        DataColumn(label: Text('DueDate')),
                                        DataColumn(label: Text('Charges')),
                                        DataColumn(label: Text('Status')),
                                        DataColumn(label: Text('info')),
                                      ],
                                      rows: (snapshot.data.data as List)
                                          .map((e) {



                                            return
                                              DataRow(cells: [

                                              DataCell(Text('${e.user.first.firstname  }${''}${e.user.first.lastname}')),

                                                DataCell(Text(e.duedate.toString())),
                                              DataCell(Text(e.charges.toString())),
                                              DataCell(
                                                e.status==0?

                                                Container(
                                                  width:80,height:20,

                                                  child:
                                                  Center(child: Text('Pending')),decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(8)),):
                                                Container(
                                                  width:80,height:20,

                                                  child:
                                                  Center(child: Text('Paid')),decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),)),
                                                DataCell(IconButton(icon: Icon(Icons.info), onPressed: () {  },)),
                                            ]);
                                      }

                                         )
                                          .toList()),
                                );
                              } else if (snapshot.hasError) {
                                return Icon(Icons.error_outline);
                              } else {
                                return Loader();
                              }
                            }),
                      ),
                    ],
                  ),
                  floatingActionButton: IconButton(
                      padding: EdgeInsets.only(top: 85),
                      iconSize: MediaQuery.of(context).size.height * 0.065,
                      icon: SvgPicture.asset('assets/floatingbutton.svg'),
                      onPressed: () {
                        Get.toNamed(generatebill, arguments: controller.user);
                      })),
            );
          }),
    );
  }
}
