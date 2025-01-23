class FavoriteModel {
  final String image;
  final String name;
  final num price;
  final String description;

  FavoriteModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.description});

  factory FavoriteModel.fromJson(Map<String, dynamic> jsonData) {
    return FavoriteModel(
      image: jsonData["image"],
      name: jsonData["name"],
      price: jsonData["price"],
      description: jsonData["description"],
    );
  }
}
