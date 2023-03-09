import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../resources/strings.dart';
import '../../utils/loading_widget.dart/loading_widget.dart';
import '../../utils/popup_dialogs/popup_dialogs.dart';
import '../network/api.dart';
import '../network/api_response.dart';
import '../network/rest_client_new.dart';

class CommonRepository {
  // //Check App version
  // static Future<dynamic> checkAppVersionApiCall({BuildContext context}) async {
  //   try {
  //     ApiResponse apiResponse = await restClientNew.get(
  //       context,
  //       Api,
  //     );
  //     if (apiResponse.) {
  //       return apiResponse.data;
  //     } else {
  //       PopupDialogs.displayMessage(context, apiResponse.message);
  //       return null;
  //     }
  //   } catch (e) {
  //     PopupDialogs.displayMessage(context, StringHelper.aPI_Crashed);
  //     return null;
  //   }
  // }

  //List<CountryData>

  static Future<bool?> addPrescriptionAPI(
      {String? userID,
      String? appointmentID,
      File? prescriptionImage,
      String? patientID,
      BuildContext? context}) async {
    FormData formData = FormData.fromMap({
      "user_id": userID,
      "patient_id": patientID,
      "appointment_id": appointmentID,
      "files": prescriptionImage != null
          ? await MultipartFile.fromFile(prescriptionImage.path,
              filename: prescriptionImage.path.split("/").last)
          : null,
    });
    //LoadingWidget.startLoadingWidget(context);
    try {
      ApiResponse apiResponse = await restClientNew
          .post(context!, Api.addPrescription, body: formData);
      if (apiResponse.status == "1") {
        LoadingWidget.endLoadingWidget(context);
        return apiResponse.status == "1";
      } else {
        LoadingWidget.endLoadingWidget(context);
        //PopupDialogs.displayMessage(context, apiResponse.message);
        return null;
      }
    } catch (e) {
      LoadingWidget.endLoadingWidget(context!);
      //PopupDialogs.displayMessage(context, StringHelper.aPI_Crashed);
      return null;
    }
  }


}
