import 'package:alumni/Constants/url_constants.dart';
import 'package:alumni/Pages/Sign%20in/Model/Request/signin_request.dart';
import 'package:alumni/Services/webservices/api_request.dart';
import 'package:alumni/Services/webservices/response_model.dart';

class SigninProvider {
  Future getSignin({
    SigninReq? signinReq,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
    Function()? beforeSend,
  }) async {
    ApiRequest(
      url: UrlConstants.signIn,
      data: signinReq,
    ).postRequest(
        onError: (error) {
          onError!(error);
        },
        onSuccess: (data) {
          onSuccess!(data);
        },
        beforeSend: () => {if (beforeSend != null) beforeSend()});
  }

  Future getSchoolBranches({
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
    Function()? beforeSend,
  }) async {
    ApiRequest(
      url: UrlConstants.getSchoolBranches,
    ).getRequest(
        onError: (error) {
          onError!(error);
        },
        onSuccess: (data) {
          onSuccess!(data);
        },
        beforeSend: () => {if (beforeSend != null) beforeSend()});
  }
}
