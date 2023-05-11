import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/constants.dart';
import 'package:societyadminapp/Module/Login/Controller/login_controller.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import 'package:societyadminapp/Widgets/My%20Password%20TextForm%20Field/my_password_textform_field.dart';
import 'package:societyadminapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
backgroundColor: HexColor('#FFFFFF'),
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height:MediaQuery.of(context).size.height*0.05,),
                            Image.asset(
                              "assets/login_vector.jpg",
                            ),
                            SizedBox(height:MediaQuery.of(context).size.height*0.05,),
                            Text("Welcome Back",textAlign: TextAlign.center,
                              style:  GoogleFonts.ubuntu(
                          color: HexColor('#4D4D4D'),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 36,
                                ),),
                            SizedBox(height:MediaQuery.of(context).size.height*0.03,),
                            Text("LOGIN TO YOUR ACCOUNT !",textAlign: TextAlign.center,
                              style:  GoogleFonts.ubuntu(
                                color: HexColor('#717171'),
                                letterSpacing:1.3 ,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),),
                            SizedBox(height:MediaQuery.of(context).size.height*0.06,),
                            MyTextFormField(controller: controller.userCnicController,
                                validator: emptyStringValidator,
                                hintText: 'Enter Cnic',
                                labelText: 'Cnic',
                                ),


                           MyPasswordTextFormField(

                             controller: controller.userPasswordController,
                             validator: emptyStringValidator,
                             labelText: 'Password',
                             hintText: 'Enter Password',

                             togglePasswordView: controller.togglePasswordView,

                               obscureText: controller.isHidden),
                            SizedBox(height:MediaQuery.of(context).size.height*0.06,),
                       MyButton(


                        color: primaryColor
                         ,onPressed: ()

                         {
                           if (_formKey.currentState!.validate()) {


                             controller.loginApi(
                                 controller.userCnicController.text,
                                 controller.userPasswordController.text);

                           }

                         }, name: 'Login',)


                          ]),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
