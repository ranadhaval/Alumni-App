import 'dart:convert';
import 'dart:io';
import 'package:alumni/Services/webservices/base_response.dart';
import 'package:alumni/Services/webservices/response_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as multi;
import 'package:dio/io.dart';

class ApiRequest {
  String url;
  dynamic data;
  Map<String, dynamic>? queryParameters;
  late Response response;
  multi.FormData? formData;
  bool isFormData = false;
  late Dio dio;
  String? savePath;
  String contentType;
  String? accessToken;

  ApiRequest(
      {required this.url,
      this.data,
      this.contentType = "application/json",
      this.accessToken = "",
      this.formData,
      this.queryParameters,
      this.savePath,
      this.isFormData = false});

  Future<bool> interNetCheck() async {
    try {
      dio = Dio();
      dio.options.followRedirects = false;
      dio.options.connectTimeout = const Duration(minutes: 3);
      dio.options.receiveTimeout = const Duration(minutes: 3);

      /* dio.httpClientAdapter = (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      } as HttpClientAdapter;*/

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on Exception {
      return false;
    }
  }

  Future<void> getRequest({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      bool isInternet = await interNetCheck();
      if (isInternet) {
        print("enterance 1");
        /* String token = "";
        if (getStorage.hasData(Constant.USER_TOKEN)) {
          token = await getStorage.read(Constant.USER_TOKEN);
        }*/
        String url = this.url; //BASE_URL +
        print("URL ==> $url");
        response = await dio.get(
          url,
          options: Options(
            headers: {
              "Authorization": 'Bearer $accessToken',
              "Content-Type": contentType,
              "accept": "*/*",
            },
          ),
        );
        // String? requestData = data is Map ? : data;
        // print("Request Data ==> ${(data)}");

        print("enterance 2");

        print("Response Data ==> ${response.data}");
        ResponseModel responseModel;
        if (response.statusCode == 200 && response.data != null) {
          responseModel = ResponseModel(
              result: response.data as Map<String, dynamic>,
              statusCode: response.statusCode,
              message: response.statusMessage);
        } else {
          responseModel = ResponseModel(
              result: null,
              statusCode: response.statusCode,
              message: response.statusMessage);
        }
        if (onSuccess != null) onSuccess(responseModel);
      } else {
        var responseModel =
            ResponseModel(result: null, statusCode: 1000, message: "try again");
        if (onError != null) onError(responseModel);
      }
    } catch (e) {
      String msg = "Something went wrong";
      int? statusCode = 500;
      if (e is DioError) {
        if (e.response?.statusCode == 401 && e.response?.data != null) {
          BaseResponse errorRes = BaseResponse.fromJson((e.response?.data));
          if (errorRes.msg == null) {
            msg = errorRes.msg!;
          }
          statusCode = 401;
          /* if (errorRes.status != null) {

          }*/
        } else {
          dynamic data = _decodeErrorResponse(e);
          msg = data["message"];
          statusCode = data["statusCode"];
        }
      }
      var responseModel =
          ResponseModel(result: null, statusCode: statusCode, message: msg);
      if (onError != null) onError(responseModel);
    }
  }

  Future<void> postRequest({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      bool isInternet = await interNetCheck();
      if (isInternet) {
        String url = "";
        url = this.url;
        print("URL ==> $url");
        if (!isFormData) {
          //debugPrint("Request Data ==> ${jsonEncode(data)}", wrapWidth: 2048);

          print("Request Data ==> ${jsonEncode(this.data)}");
          response = await dio.post(
            url,
            data: data,
            options: Options(
              headers: {
                "Authorization": 'Bearer $accessToken',
                "Content-Type": contentType,
                "accept": "*/*",
              },
            ),
          );
        } else {
          // changes made for verify otp
          dio.options.headers['Content-Type'] = contentType;

          var formData = FormData.fromMap(data);

          response = await dio.post(url, data: formData);

          print("hii enter 1");
          // try {
          //   multi.Dio dio = multi.Dio();
          //   dio.options.connectTimeout = const Duration(minutes: 3);
          //   dio.options.receiveTimeout = const Duration(minutes: 3);

          //   response = await dio.post(
          //     url,
          //     data: FormData.fromMap(data),
          //     options: Options(
          //       headers: {
          //         "x-access-token": "",
          //         "Content-Type": "multipart/form-data",
          //         "accept": "*/*",
          //         "Authorization": 'Bearer $accessToken',
          //       },
          //     ),
          //   );
          // } catch (e) {
          //   print(e);
          // }

          print("hii enter 2");
        }
        print("hyyy");

        print("hii enter 3");

        print("Post Response status code ==> ${response.statusCode}");
        // print("Post Response Data ==> ${response.headers}");
        // print("Post Response Data ==> ${response.data}");
        ResponseModel responseModel;
        if (response.statusCode == 200 && response.data != null) {
          print("ssss");
          responseModel = ResponseModel(
              result: response.data,
              statusCode: response.statusCode,
              message: response.statusMessage);

          print("Post Response Result Data ==> ${response.data}");
        } else {
          responseModel = ResponseModel(
              result: null,
              statusCode: response.statusCode,
              message: response.statusMessage);
        }
        if (onSuccess != null) onSuccess(responseModel);
      } else {
        var responseModel = ResponseModel(
            result: null, statusCode: 10000, message: "try again");
        if (onError != null) onError(responseModel);
      }
    } catch (e) {
      String? msg = "Something went wrong";
      int? statusCode = 500;
      if (e is DioError) {
        if (e.response?.statusCode == 401 && e.response?.data != null) {
          BaseResponse errorRes = BaseResponse.fromJson((e.response?.data));
          if (errorRes.msg == null) {
            msg = errorRes.msg;
          }
          statusCode = 401;
          /*  if (errorRes.status != null) {
            statusCode = errorRes.status;
          }*/
        } else {
          dynamic data = _decodeErrorResponse(e);
          // print(data);
          msg = data["message"];
          statusCode = 400;
        }
      }
      var responseModel =
          ResponseModel(result: null, statusCode: statusCode, message: msg);
      if (onError != null) onError(responseModel);
    }
  }

  Future<void> putRequest({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      bool isInternet = await interNetCheck();
      if (isInternet) {
        String url = "";
        url = this.url;

        print("URL ==> $url");
        if (!isFormData) {
          print("Request Data hhh ==> ${jsonEncode(this.data)}");

          response = await dio.put(
            url,
            data: data,
            options: Options(
              headers: {
                "Authorization": 'Bearer $accessToken',
                "Content-Type": contentType,
                "accept": "*/*",
              },
            ),
          );
        } else {
          // changes made for verify otp
          dio.options.headers['Content-Type'] = contentType;
          var formData = FormData.fromMap(data);
          response = await dio.post(url, data: formData);
        }
        print("88");
        print("Post Response Data ==> ${response.statusCode}");
        // print("Post Response Data ==> ${response.headers}");
        // print("Post Response Data ==> ${response.data}");
        ResponseModel responseModel;
        if (response.statusCode == 200 && response.data != null) {
          print("ssss");
          responseModel = ResponseModel(
              result: response.data,
              statusCode: response.statusCode,
              message: response.statusMessage);

          print("Post Response Data ==> ${response.data}");
        } else {
          responseModel = ResponseModel(
              result: null,
              statusCode: response.statusCode,
              message: response.statusMessage);
        }
        if (onSuccess != null) onSuccess(responseModel);
      } else {
        var responseModel = ResponseModel(
            result: null, statusCode: 10000, message: "try again");
        if (onError != null) onError(responseModel);
      }
    } catch (e) {
      String? msg = "Something went wrong";
      int? statusCode = 500;
      if (e is DioError) {
        if (e.response?.statusCode == 401 && e.response?.data != null) {
          BaseResponse errorRes = BaseResponse.fromJson((e.response?.data));
          if (errorRes.msg == null) {
            msg = errorRes.msg;
          }
          statusCode = 401;
          /*  if (errorRes.status != null) {
            statusCode = errorRes.status;
          }*/
        } else {
          dynamic data = _decodeErrorResponse(e);
          // print(data);
          msg = data["message"];
          statusCode = 400;
        }
      }
      var responseModel =
          ResponseModel(result: null, statusCode: statusCode, message: msg);
      if (onError != null) onError(responseModel);
    }
  }

  dynamic _decodeErrorResponse(dynamic e) {
    dynamic data = {
      "success": e.response!.data["success"],
      "message": e.response!.data["message"]
    };
    if (e is DioError) {
      if (e.type == DioErrorType.badResponse) {
        print("sfsfsf");
        // e
        print(e.response!.data);
        final response = e.response;
        try {
          if (response != null && response.data != null) {
            data["message"] =
                "${response.statusCode} : ${e.response!.data['message']}";
            data["statusCode"] = response.statusCode;
          }
        } catch (e) {
          data["message"] = "${response?.data['message']}";
        }
      } else if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        data["message"] = "Request time out";
        data["statusCode"] = 408;
      } else if (e.error is SocketException) {
        data["message"] = "No internet";
      }
    }
    return data;
  }
}
