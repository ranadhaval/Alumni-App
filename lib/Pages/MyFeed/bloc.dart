import 'dart:io';

import 'package:alumni/Pages/MyFeed/Feed_data.dart/feed_data.dart';
import 'package:alumni/Pages/MyFeed/Model/response/image_model.dart';
import 'package:alumni/Pages/MyFeed/bloc_event.dart';
import 'package:alumni/Pages/MyFeed/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadFeedBloc extends Bloc<FeedUloadInintalEvent, MainInitialState> {
  List<File> fileimageList = [];
  List<ImgDetail>? fileImgs = [];
  List<String> imageList = [];

  FeedData feedData = FeedData();

  UploadFeedBloc() : super(MainInitialState()) {
    on<FeedUloadInintalEvent>((event, emit) {
      for (var element in fileImgs!) {
        if (element.isFileLocal == true &&
            element.filepath != null &&
            element.filepath!.isNotEmpty) {
          imageList.add(element.filepath!);
        }
      }
      // fileimageList.clear();

      if (imageList != null && imageList.isNotEmpty) {
        feedData.fileUpload(imageList, "FEED",fileImgs);
      }
    });
  }
}
