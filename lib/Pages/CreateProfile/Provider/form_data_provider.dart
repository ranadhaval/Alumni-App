import 'package:alumni/Constants/url_constants.dart';
import 'package:alumni/Pages/CreateProfile/Model/Request/form_request.dart';
import 'package:alumni/Services/webservices/api_request.dart';
import 'package:alumni/Services/webservices/response_model.dart';

class FormDataProvider {
  getFormData({
    FormRequest? formRequest,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
    Function()? beforeSend,
   required String accessToken, 
  }) {
    ApiRequest(url: UrlConstants.createProfile, data: formRequest,accessToken:accessToken ).putRequest(
        onError: (error) {
          onError!(error);
        },
        onSuccess: (data) {
          onSuccess!(data);
        },
        beforeSend: () => {if (beforeSend != null) beforeSend()});
  }

  getCountry({
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
    Function()? beforeSend,
  }) {
    ApiRequest(
      url: UrlConstants.createProfile,
    ).getRequest(
        onError: (error) {
          onError!(error);
        },
        onSuccess: (data) {
          onSuccess!(data);
        },
        beforeSend: () => {if (beforeSend != null) beforeSend()});
  }

  getState({
    required String id,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
    Function()? beforeSend,
  }) {
    ApiRequest(
      url: UrlConstants.getState + id,
    ).getRequest(
        onError: (error) {
          onError!(error);
        },
        onSuccess: (data) {
          onSuccess!(data);
        },
        beforeSend: () => {if (beforeSend != null) beforeSend()});
  }

  getCity({
    required String id,
    Function(ResponseModel responseModel)? onSuccess,
    Function(ResponseModel responseModel)? onError,
    Function()? beforeSend,
  }) {
    ApiRequest(
      url: UrlConstants.getCity + id,
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
