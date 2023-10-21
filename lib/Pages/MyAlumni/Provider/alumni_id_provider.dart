import 'package:alumni/Constants/url_constants.dart';
import 'package:alumni/Services/webservices/api_request.dart';
import 'package:alumni/Services/webservices/response_model.dart';

class AlumniIdProvider {
  getAlumniId({
    String? accessToken,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
    Function()? beforeSend,
  }) {
    ApiRequest(url: UrlConstants.alumniFeedIdGetting, accessToken: accessToken)
        .getRequest(
            onError: (error) {
              onError!(error);
            },
            onSuccess: (data) {
              onSuccess!(data);
            },
            beforeSend: () => {if (beforeSend != null) beforeSend()});
  }

  getViewAlumniProfile({
    String? accessToken,
    required String id,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
    Function()? beforeSend,
  }) {
    ApiRequest(
            url: UrlConstants.getAlumniProfile + id, accessToken: accessToken)
        .getRequest(
            onError: (error) {
              onError!(error);
            },
            onSuccess: (data) {
              onSuccess!(data);
            },
            beforeSend: () => {if (beforeSend != null) beforeSend()});
  }
}
