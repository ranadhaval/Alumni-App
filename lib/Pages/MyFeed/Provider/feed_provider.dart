import 'package:alumni/Constants/url_constants.dart';
import 'package:alumni/Services/webservices/api_request.dart';
import 'package:alumni/Services/webservices/response_model.dart';
import 'package:dio/dio.dart' as multi;

class FeedProvider {
  getFeed(
      {required String accessToken,
      required String id,
      Function(ResponseModel responseModel)? onSuccess,
      Function(ResponseModel responseModel)? onError,
      Function()? beforeSend}) {
    ApiRequest(url: UrlConstants.getFeed + id, accessToken: accessToken)
        .getRequest(
            onSuccess: (data) {
              onSuccess!(data);
            },
            onError: (data) {
              onError!(data);
            },
            beforeSend: () => {if (beforeSend != null) beforeSend()});
  }

  void uploadImageFile({
    required String accessToken,
    required multi.FormData formData,
    Function()? beforeSend,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel error)? onError,
  }) {
    ApiRequest(
            url: UrlConstants.uploadImage,
            formData: formData,
            isFormData: true,
            accessToken: accessToken)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!(data);
      },
      onError: (error) {
        onError!(error);
      },
    );
  }
}
