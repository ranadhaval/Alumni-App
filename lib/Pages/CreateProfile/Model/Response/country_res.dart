class GetCountryRes {
  bool? success;
  String? message;
  List<Data>? data;

  GetCountryRes({this.success, this.message, this.data});

  GetCountryRes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
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
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? countryImage;
  String? countryCode;
  int? phoneCode;
  int? isActive;
  int? conversionPrice;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.countryImage,
      this.countryCode,
      this.phoneCode,
      this.isActive,
      this.conversionPrice,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryImage = json['countryImage'];
    countryCode = json['countryCode'];
    phoneCode = json['phoneCode'];
    isActive = json['is_active'];
    conversionPrice = json['conversionPrice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['countryImage'] = this.countryImage;
    data['countryCode'] = this.countryCode;
    data['phoneCode'] = this.phoneCode;
    data['is_active'] = this.isActive;
    data['conversionPrice'] = this.conversionPrice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
