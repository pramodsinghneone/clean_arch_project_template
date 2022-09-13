// To parse this JSON data, do
//
//     final usersEntity = usersEntityFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

UsersEntity usersEntityFromJson(String str) =>
    UsersEntity.fromJson(json.decode(str));

String usersEntityToJson(UsersEntity data) => json.encode(data.toJson());

class UsersEntity extends Equatable {
  UsersEntity({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserDetails>? data;
  Support? support;

  factory UsersEntity.fromJson(Map<String, dynamic> json) => UsersEntity(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<UserDetails>.from(
            json["data"].map((x) => UserDetails.fromJson(x))),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "support": support!.toJson(),
      };

  @override
  List<Object?> get props => [
        page,
        perPage,
        total,
        totalPages,
        data,
        support,
      ];
}

class UserDetails {
  UserDetails({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  Support({
    this.url,
    this.text,
  });

  String? url;
  String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
