import 'package:flutter/material.dart';
import 'package:alumni/Models/Common/productmodel.dart';

import '../../Constants/arrays.dart';

class ShopModel {
  final String? name;
  final String? coverImage;
  final String? brandImage;
  final int? distanceAway;

  ShopModel({
    this.name,
    this.brandImage,
    this.coverImage,
    this.distanceAway,
  });
}

class SessionModel {
  final String? name;
  final String? subtitle;
  final String? description;
  final String? coverImage;
  final String? brandImage;

  SessionModel({
    this.name,
    this.subtitle,
    this.description,
    this.coverImage,
    this.brandImage,
  });
}

class CartModel {
  final String productId;
  int? quantity;

  CartModel({required this.productId, this.quantity});

  Product getProductByID() {
    Product product = products.firstWhere((element) => element.id == productId);
    return product;
  }
}

class ListTileModel {
  final String title;
  final IconData icon;
  Widget? toggle;
  bool? enableIcon;
  final dynamic onTap;
  ShapeBorder? radius;
  ListTileModel(
      {required this.title,
      this.toggle,
      this.enableIcon = true,
      required this.onTap,
      required this.icon,
      this.radius});
}

class TitlewithValueModel {
  final String title;
  final String value;
  TitlewithValueModel({
    required this.title,
    required this.value,
  });
}

class OrderModel {
  final String id;
  final String name;
  final String coverImage;
  final DateTime date;
  final int amount;
  final int? quantity;
  final int? days;
  final OrderStatus orderStatus;

  OrderModel({
    required this.id,
    required this.name,
    required this.coverImage,
    required this.date,
    required this.amount,
    this.quantity,
    this.days,
    required this.orderStatus,
  });
}

class OrderStatus {
  static const OrderStatus Ordered = OrderStatus._('Ordered');
  static const OrderStatus Completed = OrderStatus._('Completed');
  static const OrderStatus Delivered = OrderStatus._('Delivered');
  static const OrderStatus Cancelled = OrderStatus._('Cancelled');
  static const OrderStatus Placed = OrderStatus._('Placed');

  final String status;

  const OrderStatus._(this.status);

}

class AddressModel {
  String? id;
  String? name;
  dynamic addressLine1;
  String? addressLine2;
  String? road;
  String? landmark;
  String? block;
  String? street;
  String? avenue;
  String? floor;
  String? flat;
  String? direction;
  String? mobile;
  String? alternateMobile;
  bool? customerAddressDefault;
  String? label;
  double? lat;
  double? long;
  bool? status;
  bool? active;
  int? createdAt;
  DateTime? updatedAt;
  String? userId;
  String? cityId;
  City? city;

  AddressModel({
    this.id,
    this.name,
    this.addressLine1,
    this.addressLine2,
    this.road,
    this.landmark,
    this.block,
    this.street,
    this.avenue,
    this.floor,
    this.flat,
    this.direction,
    this.mobile,
    this.alternateMobile,
    this.customerAddressDefault,
    this.label,
    this.lat,
    this.long,
    this.status,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.cityId,
    this.city,
  });
}

class City {
  String? id;
  String? name;
  String? nameAr;
  bool? status;
  bool? visibility;
  int? createdAt;
  String? updatedAt;
  String? stateId;
  StateModel? state;

  City(
      {this.id,
      this.name,
      this.nameAr,
      this.status,
      this.visibility,
      this.createdAt,
      this.updatedAt,
      this.stateId,
      this.state});
}

class StateModel {
  String? id;
  String? name;
  String? nameAr;
  bool? status;
  bool? visibility;
  int? createdAt;
  String? updatedAt;
  String? countryId;

  StateModel(
      {this.id,
      this.name,
      this.nameAr,
      this.status,
      this.visibility,
      this.createdAt,
      this.updatedAt,
      this.countryId});
}
