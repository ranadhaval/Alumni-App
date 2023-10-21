class VerifyOtpResponse {
  bool? success;
  String? message;
  Data? data;
  String? token;

  VerifyOtpResponse({this.success, this.message, this.data, this.token});

  VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  int? id;
  String? userCode;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? status;
  int? parentUserId;
  UserDetails? userDetails;
  String? pictureUrl;
  String? domainName;
  int? isVerified;
  int? isApproved;
  int? otp;
  String? lastLogin;
  String? createdAt;
  String? updatedAt;
  String? organizationName;
  String? organizationLogo;
  String? jobTitle;
  int? isProfileUpdated;

  Data(
      {this.id,
      this.userCode,
      this.firstName,
      this.lastName,
      this.email,
      this.role,
      this.status,
      this.parentUserId,
      this.userDetails,
      this.pictureUrl,
      this.domainName,
      this.isVerified,
      this.isApproved,
      this.otp,
      this.lastLogin,
      this.createdAt,
      this.updatedAt,
      this.organizationName,
      this.organizationLogo,
      this.jobTitle,
      this.isProfileUpdated});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
    status = json['status'];
    parentUserId = json['parent_user_id'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
    pictureUrl = json['picture_url'];
    domainName = json['domain_name'];
    isVerified = json['is_verified'];
    isApproved = json['is_approved'];
    otp = json['otp'];
    lastLogin = json['last_login'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    organizationName = json['organization_name'];
    organizationLogo = json['organization_logo'];
    jobTitle = json['job_title'];
    isProfileUpdated = json['is_profile_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_code'] = this.userCode;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['role'] = this.role;
    data['status'] = this.status;
    data['parent_user_id'] = this.parentUserId;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    data['picture_url'] = this.pictureUrl;
    data['domain_name'] = this.domainName;
    data['is_verified'] = this.isVerified;
    data['is_approved'] = this.isApproved;
    data['otp'] = this.otp;
    data['last_login'] = this.lastLogin;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['organization_name'] = this.organizationName;
    data['organization_logo'] = this.organizationLogo;
    data['job_title'] = this.jobTitle;
    data['is_profile_updated'] = this.isProfileUpdated;
    return data;
  }
}

class UserDetails {
  String? school;
  String? passingYear;
  String? passingClass;
  String? classRollNumber;

  UserDetails(
      {this.school, this.passingYear, this.passingClass, this.classRollNumber});

  UserDetails.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    passingYear = json['passing_year'];
    passingClass = json['passing_class'];
    classRollNumber = json['class_roll_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['school'] = this.school;
    data['passing_year'] = this.passingYear;
    data['passing_class'] = this.passingClass;
    data['class_roll_number'] = this.classRollNumber;
    return data;
  }
}
