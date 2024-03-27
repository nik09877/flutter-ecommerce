class ReviewModel {
  final int id;
  final int productId;
  final String userName;
  final String review;
  final String profileImage;
  final String date;
  const ReviewModel(
      {required this.id,
      required this.userName,
      required this.productId,
      required this.date,
      required this.review,
      required this.profileImage});

  static ReviewModel fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json["id"] ?? 0,
      userName: json["userName"] ?? "",
      review: json["review"] ?? "",
      profileImage: json["profileImage"] ?? "",
      productId: json["productId"] ?? "",
      date: json["date"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userName": userName,
      "review": review,
      "profileImage": profileImage,
      "productId": productId,
      "date": date,
    };
  }
}
