import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Module/Generate%20Bill/Controller/generate_bill_controller.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';

class GenerateBill extends GetView {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateBillController>(
      init:GenerateBillController(),

        builder: (controller) {
      return SafeArea(


        child: Scaffold(


          body: SingleChildScrollView(
            child: Form(
              key:_formKey ,
              child: Column(children: [

              MyBackButton(text: 'Generate Bill',),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.04,
              ),
              SvgPicture.asset(
                "assets/notices_vector.svg",
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.04,
              ),
              MyTextFormField(

                  onTap: () {
                    controller.chooseBillStartDate(context);
                  },
                  suffixIcon: SvgPicture.asset(
                      "assets/add_event_icon.svg",

                      fit: BoxFit.scaleDown
                  ),
                  fillColor: Colors.white,
                  controller: controller.bill_start_date,
                  validator: emptyStringValidator,
                  hintText: 'Choose Bill Start Date',
                  labelText: 'Choose Bill Start Date',


              ),

              MyTextFormField(

                  onTap: () {
                    controller.chooseBillEndDate(context);
                  },
                  suffixIcon: SvgPicture.asset(
                      "assets/add_event_icon.svg",

                      fit: BoxFit.scaleDown
                  ),
                  fillColor: Colors.white,
                  controller: controller.bill_end_date,
                  validator: emptyStringValidator,
                  hintText: 'Choose Bill END Date',
                  labelText: 'Choose Bill END Date',
                ),
              MyTextFormField(

                  onTap: () {
                    controller.chooseBillDueDate(context);
                  },
                  suffixIcon: SvgPicture.asset(
                      "assets/add_event_icon.svg",

                      fit: BoxFit.scaleDown
                  ),
                  fillColor: Colors.white,
                  controller: controller.bill_due_date,
                  validator: emptyStringValidator,
                  hintText: 'Choose Bill Due Date',
                  labelText: 'Choose Bill Due Date',
                ),

MyButton(name: 'Generate', onPressed:controller.isLoading?null: () async{


  print(controller.user.userid);
  print(controller.bill_start_date.text);
  print(controller.bill_end_date.text);
  print(controller.bill_due_date.text);
  print(controller.status);


  await  controller.generateBillApi(billstartdate: controller.bill_start_date.text,
      billenddate: controller.bill_end_date.text,
      duedate: controller.bill_due_date.text,
      status: controller.status,
      bearerToken: controller.user.bearerToken!,
      subadminid: controller.user.userid!);


},)

        ],),
            ),
          ),)
        ,

      );
    });
  }
}

