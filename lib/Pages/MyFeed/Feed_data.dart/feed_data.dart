import 'dart:convert';
import 'dart:io';

import 'package:alumni/Pages/MyFeed/Model/response/feed_response.dart';
import 'package:alumni/Pages/MyFeed/Model/response/image_model.dart';
import 'package:alumni/Pages/MyFeed/Model/response/uploadimage_response.dart';
import 'package:alumni/Pages/MyFeed/Provider/feed_provider.dart';
import 'package:alumni/Services/webservices/response_model.dart';
import 'package:alumni/utils/extentions.dart';
import 'package:dio/dio.dart' as dia;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http_parser/http_parser.dart' as parser;

class FeedData {
  GetStorage storage = GetStorage();
  FeedRes feedRes = FeedRes();
  String? errorMessage;
  getFeedData() async {
    print(storage.read("id"));
    await FeedProvider().getFeed(
        accessToken: storage.read("Token"),
        id: storage.read("id"),
        onSuccess: ((ResponseModel responseModel) async {
          if (responseModel.statusCode == 200) {
            await Future.delayed(const Duration(seconds: 4), () {
              feedRes = FeedRes.fromJson(responseModel.result);
            });
          }
        }),
        onError: ((ResponseModel responseModel) {
          errorMessage = responseModel.message.toString();
        }));

    Future.delayed(const Duration(seconds: 3));
  }

  UploadImageRes? responseData;
  fileUpload(List<String>? images, String from, List<ImgDetail>? fileImgs) {
    String imageFor = "FEEDS";
    if (from.equalsIgnoreCase("FEEDS")) {
      imageFor = "FEEDS";
    }
    print("file is :- ${images![0]}");

    Map<String, dynamic> map = {};

    map["category"] = "FEEDS";
    // map["file"] = fileImgs;

    images.asMap().forEach((index, element) async {
      print(index);
      var imageIndex = "${"image"}$index";
      File f = File(element);
      String fileName = f.path.split('/').last;
      Uint8List bytes = await f.readAsBytes();
      ByteData byteData = ByteData.view(bytes.buffer);
      var result = await FlutterImageCompress.compressWithList(
          byteData.buffer.asUint8List(),
          quality: 50);
      dia.MultipartFile multipartFile = dia.MultipartFile.fromBytes(result,
          filename: fileName, contentType: parser.MediaType("image", "jpg"));
      map[imageIndex] = multipartFile;
      if ((images.length - 1) == index) {
        dia.FormData formData = dia.FormData.fromMap(map);

        print(formData.fields);
        FeedProvider().uploadImageFile(
          accessToken: storage.read("Token"),
          formData: FormData.fromMap({'category': 'FEEDS', 'file': fileImgs}),
          onSuccess: (ResponseModel response) {
            if (response.statusCode == 200) {
              if (response.result != null) {
                try {
                  responseData =
                      UploadImageRes.fromJson(jsonDecode(response.result));
                } on Exception catch (e) {
                  print(e.toString());
                }
              }
            } else {
              print("error");
            }
          },
          onError: (ResponseModel error) {
            print(error.message!);
          },
        );
      }
    });
  }

// fileUpload(List<String>? images, String from, List<ImgDetail>? fileImgs)
// {
//        FeedProvider().uploadImageFile(
//           accessToken: storage.read("Token"),
//           formData: FormData.fromMap({'category': 'FEEDS', 'file': fileImgs}),
//           onSuccess: (ResponseModel response) {
//             if (response.statusCode == 200) {
//               if (response.result != null) {
//                 try {
//                   responseData =
//                       UploadImageRes.fromJson(jsonDecode(response.result));
//                 } on Exception catch (e) {
//                   print(e.toString());
//                 }
//               }
//             } else {
//               print("error");
//             }
//           },
//           onError: (ResponseModel error) {
//             print(error.message!);
//           },
//         );
// }

}
