class VerifyOtpReq {
  int? userOtp;
  int? userId;

  VerifyOtpReq({this.userOtp, this.userId});

  VerifyOtpReq.fromJson(Map<String, dynamic> json) {
    userOtp = json['userOtp'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userOtp'] = this.userOtp;
    data['userId'] = this.userId;
    return data;
  }
}