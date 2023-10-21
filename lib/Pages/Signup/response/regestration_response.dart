class RegestrationRes {
  bool? success;
  String? message;
  Data? data;
  String? token;

  RegestrationRes({this.success, this.message, this.data, this.token});

  RegestrationRes.fromJson(Map<String, dynamic> json) {
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
  String? createdAt;
  String? updatedAt;
  bool? isApproved;
  bool? isProfileUpdated;
  int? id;
  String? userCode;
  String? firstName;
  String? lastName;
  String? email;
  String? domainName;
  String? organizationName;
  String? jobTitle;
  String? role;
  String? status;
  bool? isVerified;
  int? otp;
  int? parentUserId;
  UserDetail? userDetails;

  Data(
      {this.createdAt,
      this.updatedAt,
      this.isApproved,
      this.isProfileUpdated,
      this.id,
      this.userCode,
      this.firstName,
      this.lastName,
      this.email,
      this.domainName,
      this.organizationName,
      this.jobTitle,
      this.role,
      this.status,
      this.isVerified,
      this.otp,
      this.parentUserId,
      this.userDetails});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isApproved = json['is_approved'];
    isProfileUpdated = json['is_profile_updated'];
    id = json['id'];
    userCode = json['user_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    domainName = json['domain_name'];
    organizationName = json['organization_name'];
    jobTitle = json['job_title'];
    role = json['role'];
    status = json['status'];
    isVerified = json['is_verified'];
    otp = json['otp'];
    parentUserId = json['parent_user_id'];
    userDetails = json['user_details'] != null
        ? new UserDetail.fromJson(json['user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['is_approved'] = this.isApproved;
    data['is_profile_updated'] = this.isProfileUpdated;
    data['id'] = this.id;
    data['user_code'] = this.userCode;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['domain_name'] = this.domainName;
    data['organization_name'] = this.organizationName;
    data['job_title'] = this.jobTitle;
    data['role'] = this.role;
    data['status'] = this.status;
    data['is_verified'] = this.isVerified;
    data['otp'] = this.otp;
    data['parent_user_id'] = this.parentUserId;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetail {
  String? school;
  String? passingYear;
  String? passingClass;
  String? classRollNumber;

  UserDetail(
      {this.school, this.passingYear, this.passingClass, this.classRollNumber});

  UserDetail.fromJson(Map<String, dynamic> json) {
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
