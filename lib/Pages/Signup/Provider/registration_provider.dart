import 'package:alumni/Constants/url_constants.dart';
import 'package:alumni/Pages/Signup/request/regestartion_request.dart';
import 'package:alumni/Services/webservices/api_request.dart';
import 'package:alumni/Services/webservices/response_model.dart';

class RegisterProvider {
  void getRegister({
    RegestrationReq? registerReq,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
    Function()? beforeSend,
  }) {
    ApiRequest(url: UrlConstants.signUp, data: registerReq).postRequest(
        onError: (error) {
          onError!(error);
        },
        onSuccess: (data) {
          onSuccess!(data);
        },
        beforeSend: () => {if (beforeSend != null) beforeSend()});
  }
}
