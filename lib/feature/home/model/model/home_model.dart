class HomeModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final HomeRatingModel homeRatingModel;

  HomeModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.homeRatingModel,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
      homeRatingModel: HomeRatingModel.fromJson(json["rating"]),
    );
  }
}

class HomeRatingModel {
  final num rate;
  final num count;

  HomeRatingModel({required this.rate, required this.count});

  factory HomeRatingModel.fromJson(Map<String, dynamic> json) {
    return HomeRatingModel(rate: json["rate"], count: json["count"]);
  }
}

