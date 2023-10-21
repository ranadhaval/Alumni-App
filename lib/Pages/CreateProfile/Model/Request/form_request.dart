class FormRequest {
  PersonalDetailsRequest? personalDetails;
  List<EducationDetailsRequest>? educationDetails;
  List<ProfessionalDetailsRequest>? professionalDetails;

  FormRequest(
      {this.personalDetails, this.educationDetails, this.professionalDetails});

  FormRequest.fromJson(Map<String, dynamic> json) {
    personalDetails = json['personal_details'] != null
        ? new PersonalDetailsRequest.fromJson(json['personal_details'])
        : null;
    if (json['education_details'] != null) {
      educationDetails = <EducationDetailsRequest>[];
      json['education_details'].forEach((v) {
        educationDetails!.add(new EducationDetailsRequest.fromJson(v));
      });
    }
    if (json['professional_details'] != null) {
      professionalDetails = <ProfessionalDetailsRequest>[];
      json['professional_details'].forEach((v) {
        professionalDetails!.add(new ProfessionalDetailsRequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    return data;
  }
}

class PersonalDetailsRequest {
  AddressRequest? address;
  String? dob;
  int? phone;
  String? bio;
  String? contactWay;

  PersonalDetailsRequest(
      {this.address, this.dob, this.phone, this.bio, this.contactWay});

  PersonalDetailsRequest.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new AddressRequest.fromJson(json['address']) : null;
    dob = json['dob'];
    phone = json['phone'];
    bio = json['bio'];
    contactWay = json['contact_way'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['bio'] = this.bio;
    data['contact_way'] = this.contactWay;
    return data;
  }
}

class AddressRequest {
  String? street;
  String? country;
  String? city;
  String? state;
  int? zip;

  AddressRequest({this.street, this.country, this.city, this.state, this.zip});

  AddressRequest.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    country = json['country'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['country'] = this.country;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    return data;
  }
}

class EducationDetailsRequest {
  String? school;
  int? standard;
  String? passingYear;
  bool? existingSchool;
  String? country;
  String? state;
  String? degree;

  EducationDetailsRequest(
      {this.school,
      this.standard,
      this.passingYear,
      this.existingSchool,
      this.country,
      this.state,
      this.degree});

  EducationDetailsRequest.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    standard = json['standard'];
    passingYear = json['passing_year'];
    existingSchool = json['existing_school'];
    country = json['country'];
    state = json['state'];
    degree = json['degree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['school'] = this.school;
    data['standard'] = this.standard;
    data['passing_year'] = this.passingYear;
    data['existing_school'] = this.existingSchool;
    data['country'] = this.country;
    data['state'] = this.state;
    data['degree'] = this.degree;
    return data;
  }
}

class ProfessionalDetailsRequest {
  String? company;
  String? designation;
  String? country;
  String? state;
  String? employmentType;
  String? startDate;
  String? endDate;

  ProfessionalDetailsRequest(
      {this.company,
      this.designation,
      this.country,
      this.state,
      this.employmentType,
      this.startDate,
      this.endDate});

  ProfessionalDetailsRequest.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    designation = json['designation'];
    country = json['country'];
    state = json['state'];
    employmentType = json['employment_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['designation'] = this.designation;
    data['country'] = this.country;
    data['state'] = this.state;
    data['employment_type'] = this.employmentType;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}