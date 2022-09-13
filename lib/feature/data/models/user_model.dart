import 'package:clean_arch_project_template/feature/domain/entity/users_entity.dart';

class UserModel extends UsersEntity {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserDetails>? data;
  Support? support;

  UserModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  }) : super(
          data: data,
          page: page,
          perPage: perPage,
          support: support,
          total: total,
          totalPages: totalPages,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
}
