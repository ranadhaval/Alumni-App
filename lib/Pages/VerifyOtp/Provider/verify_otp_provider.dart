import 'package:alumni/Constants/url_constants.dart';
import 'package:alumni/Pages/VerifyOtp/Model/Request/verify_otp_request.dart';
import 'package:alumni/Services/webservices/api_request.dart';
import 'package:alumni/Services/webservices/response_model.dart';

class VerifyOtpProvider {
   getVerifyOtp({
    VerifyOtpReq? verifyOtpReq,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
    Function()? beforeSend,
  }) {
    ApiRequest(url: UrlConstants.verifyOtp, data: verifyOtpReq).postRequest(
        onError: (error) {
          onError!(error);
        },
        onSuccess: (data) {
          onSuccess!(data);
        },
        beforeSend: () => {if (beforeSend != null) beforeSend()});
  }
}
