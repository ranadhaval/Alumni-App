class ViewAlumniProfileRes {
  bool? success;
  Data? data;

  ViewAlumniProfileRes({this.success, this.data});

  ViewAlumniProfileRes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  UserDetails? userDetails;
  String? pictureUrl;
  String? createdAt;
  AlumniProfileDetails? alumniProfileDetails;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.userDetails,
      this.pictureUrl,
      this.createdAt,
      this.alumniProfileDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
    pictureUrl = json['picture_url'];
    createdAt = json['createdAt'];
    alumniProfileDetails = json['alumniProfileDetails'] != null
        ? new AlumniProfileDetails.fromJson(json['alumniProfileDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    data['picture_url'] = this.pictureUrl;
    data['createdAt'] = this.createdAt;
    if (this.alumniProfileDetails != null) {
      data['alumniProfileDetails'] = this.alumniProfileDetails!.toJson();
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

class AlumniProfileDetails {
  String? name;

  AlumniProfileDetails({this.name});

  AlumniProfileDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
