class CartModel {
  final String id;
  final String status;
  final String category;
  final String name;
  final String description;
  final num price;
  final String image;
  final String company;
  final int quantity;
  final num totalPrice;

  CartModel({
    required this.id,
    required this.status,
    required this.category,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.company,
    required this.quantity,
    required this.totalPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> jsonData) {
    return CartModel(
      id: jsonData["_id"],
      status: jsonData["status"],
      category: jsonData["category"],
      name: jsonData["name"],
      description: jsonData["description"],
      price: jsonData["price"],
      image: jsonData["image"],
      company: jsonData["company"],
      quantity: jsonData["quantity"],
      totalPrice: jsonData["totalPrice"],
    );
  }
}
