import 'package:alumni/Pages/VerifyOtp/Model/Request/verify_otp_request.dart';
import 'package:alumni/Pages/VerifyOtp/Model/Response/verify_otp_response.dart';
import 'package:alumni/Pages/VerifyOtp/Provider/verify_otp_provider.dart';
import 'package:alumni/Services/webservices/response_model.dart';
import 'package:alumni/Widgets/classes/widget_helper_class.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class VerifyOtpData {
  VerifyOtpResponse verifyOtpRes = VerifyOtpResponse();
  String? errorMessage;

  getverifyOtp({
    required int userOtp,
    required int userId,
  }) async {
    VerifyOtpReq verifyOtpReq = VerifyOtpReq(userOtp: userOtp, userId: userId);

    await VerifyOtpProvider().getVerifyOtp(
        verifyOtpReq: verifyOtpReq,
        onSuccess: ((ResponseModel responseModel) async {
          if (responseModel.statusCode == 200) {
            await Future.delayed(const Duration(seconds: 4), () {
              verifyOtpRes = VerifyOtpResponse.fromJson(responseModel.result);
            });
            await Future.delayed(const Duration(seconds: 1), () {
              verifyOtpRes;
            });
          }
        }),
        onError: ((ResponseModel responseModel) async {
          errorMessage = responseModel.message.toString();
          ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            WidgetHelper.getSnackBar(context as BuildContext,
                responseModel.message.toString(), Colors.red),
          );
        }));

    Future.delayed(const Duration(seconds: 3), () {});
  }
}
