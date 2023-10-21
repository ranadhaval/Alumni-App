import 'dart:typed_data';
import 'dart:io';

class ImgDetail {
  String? imagename;
  String? imagepath;
  String? pOImgId;
  String? imgId;

  //Asset asset;
  Uint8List? uint8list;
  String? filetype;
  String? filepath;

  //XFile? file;
  bool? isFileLocal = false;
  bool? isFileUpload = false;
  File? file;

  ImgDetail(
      {this.imagename,
      this.imagepath,
      this.pOImgId,
      this.imgId,
      this.filetype,
      this.isFileLocal,
      this.isFileUpload,
      this.filepath,
      this.file});

  ImgDetail.fromJson(Map<String, dynamic> json) {
    imagename = json['imagename'];
    imagepath = json['imagepath'];
    pOImgId = json['PO_imgId'];
    imgId = json['imgId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagename'] = this.imagename;
    data['imagepath'] = this.imagepath;
    data['PO_imgId'] = this.pOImgId;
    data['imgId'] = this.imgId;
    return data;
  }
}
