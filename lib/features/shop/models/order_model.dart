class OrderModel {
  final int id;
  final String userId;
  final String status;
  final String orderAmount;
  final String orderDate;

  const OrderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.orderAmount,
    required this.orderDate,
  });

  static OrderModel fromJson(Map<String, dynamic> json) {
    return OrderModel(
        id: json["id"] ?? 0,
        userId: json["userId"] ?? "",
        status: json["status"] ?? "",
        orderAmount: json["orderAmount"] ?? "",
        orderDate: json["orderDate"] ?? "");
  }
}
