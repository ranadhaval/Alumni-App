class AlumniIdRes {
  bool? success;
  List<Data>? data;

  AlumniIdRes({this.success, this.data});

  AlumniIdRes.fromJson(Map<String, dynamic> json) {
    success = json['success'];

    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.userDetails,
      this.pictureUrl,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
    pictureUrl = json['picture_url'];
    createdAt = json['createdAt'] ?? "";
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
    return data;
  }
}

class UserDetails {
  String? school;
  String? passingYear;
  String? passingClass;
  String? classRollNumber;

  UserDetails(
      {this.school,
      this.passingYear,
      //
      this.passingClass,
      this.classRollNumber});

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
    // data['passing_class'] = this.passingClass;
    // data['class_roll_number'] = this.classRollNumber;
    return data;
  }
}
