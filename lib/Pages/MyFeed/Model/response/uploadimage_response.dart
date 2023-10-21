class UploadImageRes {
  bool? success;
  String? message;
  String? fileUrl;
  String? signedUrl;

  UploadImageRes({this.success, this.message, this.fileUrl, this.signedUrl});

  UploadImageRes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    fileUrl = json['fileUrl'];
    signedUrl = json['signedUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['fileUrl'] = this.fileUrl;
    data['signedUrl'] = this.signedUrl;
    return data;
  }
}
