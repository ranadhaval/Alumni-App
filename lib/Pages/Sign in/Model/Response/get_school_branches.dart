class GetSchoolBranches {
  bool? success;
  List<SchoolBranches>? schoolBranches;

  GetSchoolBranches({this.success, this.schoolBranches});

  GetSchoolBranches.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['schoolBranches'] != null) {
      schoolBranches = <SchoolBranches>[];
      json['schoolBranches'].forEach((v) {
        schoolBranches!.add(new SchoolBranches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.schoolBranches != null) {
      data['schoolBranches'] =
          this.schoolBranches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SchoolBranches {
  int? id;
  String? userCode;
  String? organizationName;
  String? organizationLogo;

  SchoolBranches(
      {this.id, this.userCode, this.organizationName, this.organizationLogo});

  SchoolBranches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    organizationName = json['organization_name'];
    organizationLogo = json['organization_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_code'] = this.userCode;
    data['organization_name'] = this.organizationName;
    data['organization_logo'] = this.organizationLogo;
    return data;
  }
}
