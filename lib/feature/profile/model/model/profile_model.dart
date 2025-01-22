class ProfileModel {
  final String nationalId;
  final String name;
  final String phone;
  final String email;
  final String gender;
  final String profileImage;

  ProfileModel({
    required this.nationalId,
    required this.gender,
    required this.name,
    required this.phone,
    required this.email,
    required this.profileImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileModel(
      nationalId: jsonData["nationalId"] ?? "",
      name: jsonData["name"] ?? "",
      phone: jsonData["phone"] ?? "",
      email: jsonData["email"] ?? "",
      profileImage: jsonData["profileImage"] ?? "",
      gender: jsonData["gender"] ?? "",
    );
  }
}

class ProfileUserModel {
  final ProfileModel profileModel;

  ProfileUserModel({required this.profileModel});

  factory ProfileUserModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileUserModel(
        profileModel: ProfileModel.fromJson(jsonData["user"]));
  }
}
// https://elwekala.onrender.com/user/profile
//     {"token"
// }
//
//
// //
// https://elwekala.onrender.com/product/Laptops
//
// //
// addCart
// https://elwekala.onrender.com/cart/add
//     {"nationalId":, "productId":, "quantity": }
//
// delete
//
// https://elwekala.onrender.com/cart/delete
//     {
// "nationalId":
// "productId":
// "quantity":
// }
//
// https://elwekala.onrender.com/cart/allProducts
