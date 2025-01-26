class LaptopModel {
  final String id;
  final String status;
  final String category;
  final String name;
  final num price;
  final String description;
  final String image;
  final String company;
  final int countInStock;

  LaptopModel({
    required this.id,
    required this.status,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.company,
    required this.countInStock,
  });

  factory LaptopModel.fromJson(Map<String, dynamic> jsonData) {
    return LaptopModel(
      id: jsonData["_id"],
      status: jsonData["status"],
      category: jsonData["category"],
      name: jsonData["name"],
      price: jsonData["price"],
      description: jsonData["description"],
      image: jsonData["image"],
      company: jsonData["company"],
      countInStock: jsonData["countInStock"],
    );
  }
}
