import 'package:flutter_clean_architecture/data/models/user_model.dart';

class UserResponse {
  UserResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserModel> data;

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      page: json["page"],
      perPage: json["per_page"],
      total: json["total"],
      totalPages: json["total_pages"],
      data: List<UserModel>.from(
        json["data"].map(
          (x) => UserModel.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "page": page,
      "per_page": perPage,
      "total": total,
      "total_pages": totalPages,
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}
