class FeedRes {
  bool? success;
  List<Data>? data;

  FeedRes({this.success, this.data});

  FeedRes.fromJson(Map<String, dynamic> json) {
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
  String? organizationId;
  String? feedType;
  String? feedText;
  String? feedImage;
  String? feedTitle;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.organizationId,
      this.feedType,
      this.feedText,
      this.feedImage,
      this.feedTitle,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    organizationId = json['organization_id'];
    feedType = json['feed_type'];
    feedText = json['feed_text'];
    feedImage = json['feed_image'];
    feedTitle = json['feed_title'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['organization_id'] = this.organizationId;
    data['feed_type'] = this.feedType;
    data['feed_text'] = this.feedText;
    data['feed_image'] = this.feedImage;
    data['feed_title'] = this.feedTitle;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
