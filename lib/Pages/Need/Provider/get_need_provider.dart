import 'package:alumni/Constants/url_constants.dart';
import 'package:alumni/Services/webservices/api_request.dart';
import 'package:alumni/Services/webservices/response_model.dart';

class GetNeedProvider {
  getNeed({
    required String accessToken,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
    Function()? beforeSend,
  }) {
    ApiRequest(url: UrlConstants.getNeed, accessToken: accessToken).postRequest(
        onError: (error) {
          onError!(error);
        },
        onSuccess: (data) {
          onSuccess!(data);
        },
        beforeSend: () => {if (beforeSend != null) beforeSend()});
  }
}
