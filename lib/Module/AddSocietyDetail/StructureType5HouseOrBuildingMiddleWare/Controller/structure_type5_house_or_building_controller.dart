import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../Login/Model/User.dart';

class StructureType5HouseOrBuildingMiddlewareController extends GetxController {
  var data = Get.arguments;

  late final User user;
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    user = data;
  }
}
