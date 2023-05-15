import 'dart:convert';

import 'package:get/get.dart';
import 'package:societyadminapp/Module/Generate%20Bill/Model/BillModel.dart';

import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart' as U;



import 'package:http/http.dart' as Http;

class GeneratedBillController extends GetxController
{
  var userdata = Get.arguments;

  late final U.User user;
  String? firstname;
  String? lastname;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init");
    user = this.userdata;

  }

  generatedBillApi(
      int subadminid, String token) async {
    final response = await Http.get(
      Uri.parse(Api.generatedBill + "/" + subadminid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    print(response.body.toString());
    print(response.statusCode.toString());

    if (response.statusCode == 200) {


      return BillModel.fromJson(data);
    }
    return BillModel.fromJson(data);
  }


}