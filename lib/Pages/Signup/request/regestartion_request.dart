class RegestrationReq {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? parentUserId;
  UserDetails? userDetails;

  RegestrationReq(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.parentUserId,
      this.userDetails});

  RegestrationReq.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    parentUserId = json['parent_user_id'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['parent_user_id'] = this.parentUserId;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
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
