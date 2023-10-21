class FormRes {
  bool? success;
  String? message;
  Data? data;

  FormRes({this.success, this.message, this.data});

  FormRes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
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
  UserProfileDetails? userProfileDetails;

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
      this.isProfileUpdated,
      this.userProfileDetails});

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
    userProfileDetails = json['userProfileDetails'] != null
        ? new UserProfileDetails.fromJson(json['userProfileDetails'])
        : null;
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
    if (this.userProfileDetails != null) {
      data['userProfileDetails'] = this.userProfileDetails!.toJson();
    }
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

class UserProfileDetails {
  int? id;
  int? userId;
  PersonalDetails? personalDetails;
  List<EducationDetails>? educationDetails;
  List<ProfessionalDetails>? professionalDetails;
  String? createdAt;
  String? updatedAt;

  UserProfileDetails(
      {this.id,
      this.userId,
      this.personalDetails,
      this.educationDetails,
      this.professionalDetails,
      this.createdAt,
      this.updatedAt});

  UserProfileDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    personalDetails = json['personal_details'] != null
        ? new PersonalDetails.fromJson(json['personal_details'])
        : null;
    if (json['education_details'] != null) {
      educationDetails = <EducationDetails>[];
      json['education_details'].forEach((v) {
        educationDetails!.add(new EducationDetails.fromJson(v));
      });
    }
    if (json['professional_details'] != null) {
      professionalDetails = <ProfessionalDetails>[];
      json['professional_details'].forEach((v) {
        professionalDetails!.add(new ProfessionalDetails.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    if (this.personalDetails != null) {
      data['personal_details'] = this.personalDetails!.toJson();
    }
    if (this.educationDetails != null) {
      data['education_details'] =
          this.educationDetails!.map((v) => v.toJson()).toList();
    }
    if (this.professionalDetails != null) {
      data['professional_details'] =
          this.professionalDetails!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class PersonalDetails {
  String? bio;
  String? dob;
  int? phone;
  Address? address;
  String? contactWay;

  PersonalDetails(
      {this.bio, this.dob, this.phone, this.address, this.contactWay});

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    bio = json['bio'];
    dob = json['dob'];
    phone = json['phone'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    contactWay = json['contact_way'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bio'] = this.bio;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['contact_way'] = this.contactWay;
    return data;
  }
}

class Address {
  int? zip;
  String? city;
  String? state;
  String? street;
  String? country;

  Address({this.zip, this.city, this.state, this.street, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    zip = json['zip'];
    city = json['city'];
    state = json['state'];
    street = json['street'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zip'] = this.zip;
    data['city'] = this.city;
    data['state'] = this.state;
    data['street'] = this.street;
    data['country'] = this.country;
    return data;
  }
}

class EducationDetails {
  String? school;
  int? standard;
  String? passingYear;
  bool? existingSchool;
  String? state;
  String? degree;
  String? country;

  EducationDetails(
      {this.school,
      this.standard,
      this.passingYear,
      this.existingSchool,
      this.state,
      this.degree,
      this.country});

  EducationDetails.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    standard = json['standard'];
    passingYear = json['passing_year'];
    existingSchool = json['existing_school'];
    state = json['state'];
    degree = json['degree'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['school'] = this.school;
    data['standard'] = this.standard;
    data['passing_year'] = this.passingYear;
    data['existing_school'] = this.existingSchool;
    data['state'] = this.state;
    data['degree'] = this.degree;
    data['country'] = this.country;
    return data;
  }
}

class ProfessionalDetails {
  String? state;
  String? company;
  String? country;
  String? endDate;
  String? startDate;
  String? designation;
  String? employmentType;

  ProfessionalDetails(
      {this.state,
      this.company,
      this.country,
      this.endDate,
      this.startDate,
      this.designation,
      this.employmentType});

  ProfessionalDetails.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    company = json['company'];
    country = json['country'];
    endDate = json['end_date'];
    startDate = json['start_date'];
    designation = json['designation'];
    employmentType = json['employment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['company'] = this.company;
    data['country'] = this.country;
    data['end_date'] = this.endDate;
    data['start_date'] = this.startDate;
    data['designation'] = this.designation;
    data['employment_type'] = this.employmentType;
    return data;
  }
}
