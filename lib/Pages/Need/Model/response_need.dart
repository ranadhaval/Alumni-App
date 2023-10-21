class NeedRes {
  bool? success;
  List<Data>? data;

  NeedRes({this.success, this.data});

  NeedRes.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  int? organizationId;
  String? needType;
  String? needText;
  String? documentType;
  String? documentUrl;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.organizationId,
      this.needType,
      this.needText,
      this.documentType,
      this.documentUrl,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    organizationId = json['organization_id'];
    needType = json['need_type'];
    needText = json['need_text'];
    documentType = json['document_type'];
    documentUrl = json['document_url'];
    isActive = json['is_active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['organization_id'] = this.organizationId;
    data['need_type'] = this.needType;
    data['need_text'] = this.needText;
    data['document_type'] = this.documentType;
    data['document_url'] = this.documentUrl;
    data['is_active'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
