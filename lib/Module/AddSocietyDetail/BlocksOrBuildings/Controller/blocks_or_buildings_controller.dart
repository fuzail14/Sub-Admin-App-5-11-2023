import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../../Constants/api_routes.dart';
import '../../../Login/Model/User.dart';

class BlockOrBuildingController extends GetxController {
  var data = Get.arguments;

  int? pid;
  String? bearerToken;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    pid = data[0];
    bearerToken = data[1];
  }
}
