import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import 'package:http/http.dart' as Http;

import '../Model/MeasurementModel.dart';

class AddMeasurementController extends GetxController {
  String? propertyVal;
  String? unitVal;
  bool isLoading = false;
  final TextEditingController chargesController = TextEditingController();
  final TextEditingController chargesAfterDueDateController =
      TextEditingController();
  final TextEditingController appChargesController = TextEditingController();
  final TextEditingController taxController = TextEditingController();
  final TextEditingController bedRoomsController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  var userdata = Get.arguments;
  late final User user;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    user = userdata;
  }

  String? unitLabel;

  bool isArea = false;
  List<String> property_types = ['house', 'apartment'];
  List<String> measurements_types = [];

  setPropertyVal(val) {
    propertyVal = val;
    update();
  }

  setMeasurementVal(val) {
    unitVal = val;
    update();
  }

  setArea() {
    isArea = true;
    update();
  }

  Future addMeasurementApi({
    required int userid,
    required String bearerToken,
    required String propertyType,
    required String unitType,
    required String charges,
    required String bedrooms,
    required String area,
    required String serviceChargesAfterDueDate,
    required String appCharges,
    required String tax,
  }) async {
    print(userid);
    print(bearerToken);
    print(propertyType);
    print(unitType);
    print(charges);
    print(bedrooms);
    print(area);
    isLoading = true;
    update();
    final response = await Http.post(
      Uri.parse(Api.addmeasurement),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $bearerToken"
      },
      body: jsonEncode(<String, dynamic>{
        "subadminid": userid,
        'type': propertyType,
        'unit': unitType,
        'charges': charges,
        'area': area,
        'bedrooms': bedrooms,
        "status": 0,
        "chargesafterduedate": serviceChargesAfterDueDate,
        "appcharges": double.tryParse(appCharges),
        "tax": tax
      }),
    );

    if (response.statusCode == 200) {
      Get.snackbar("Successful", "Measurement Added !");
      isLoading = false;
      propertyVal = null;
      unitVal = null;
      clearText();

      update();
    } else if (response.statusCode == 403) {
      var data = jsonDecode(response.body.toString());
      (data['errors'] as List)
          .map((e) => Get.snackbar(
                "Error",
                e.toString(),
              ))
          .toList();

      propertyVal = null;
      unitVal = null;

      chargesController.clear();
      bedRoomsController.clear();
      areaController.clear();
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
      Get.snackbar("Error", "Failed to Add Measurement");
    }
  }

  Future<MeasurementModel> housesApartmentsModelApi(
      {required int subadminid,
      required String token,
      required String type}) async {
    final response = await Http.get(
      Uri.parse(Api.housesapartmentmeasurements +
          "/" +
          subadminid.toString() +
          "/" +
          type.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return MeasurementModel.fromJson(data);
    }
    return MeasurementModel.fromJson(data);
  }

  calculate(servicecharges) {
    double? serviceCharges = double.tryParse(servicecharges) ?? 0.0;
    double app_percentage = 2;
    double tax_percentage = 15;
    double after_due_date_fine = 0.05;
    double app_charges = serviceCharges! * (app_percentage / 100);
    double tax_charges = serviceCharges * (tax_percentage / 100);
    double after_duedate_charges =
        (serviceCharges * after_due_date_fine) + serviceCharges;

    taxController.text = tax_charges.toString();
    appChargesController.text = app_charges.toString();
    chargesAfterDueDateController.text = after_duedate_charges.toString();

    update();
  }

  clearText() {
    taxController.text = '';
    appChargesController.text = '';
    chargesAfterDueDateController.text = '';
    chargesController.text = '';
    bedRoomsController.text = '';
    areaController.text = '';
    update();
  }
}
