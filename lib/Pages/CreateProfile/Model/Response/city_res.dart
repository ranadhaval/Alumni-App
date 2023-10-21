class GetCityRes {
  bool? success;
  List<Data>? data;

  GetCityRes({this.success, this.data});

  GetCityRes.fromJson(Map<String, dynamic> json) {
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
  int? stateId;
  String? name;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.stateId,
      this.name,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['stateId'];
    name = json['name'];
    isActive = json['is_active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stateId'] = this.stateId;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}