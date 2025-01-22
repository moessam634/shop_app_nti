import 'package:dio/dio.dart';
import 'package:shopping_app/core/helper/cache_data/cache_data.dart';
import 'package:shopping_app/feature/cart/data/model/cart_model.dart';

var getNationalId = SharedPref.sharedPref!.get("nationalId");

class AddCartData {
  final Dio dio = Dio();

  addCartData({required String productId}) async {
    var response = await dio.post(
      "https://elwekala.onrender.com/cart/add",
      data: {
        "nationalId": getNationalId,
        "productId": productId,
        "quantity": "1"
      },
    );
    var repoData = response.data;
    print(repoData);
    return repoData; // مش محتاج ارجع حاجه هنا اضيف بس
  }

  getAllProducts() async {
    var response = await dio.get(
        "https://elwekala.onrender.com/cart/allProducts",
        data: {"nationalId": getNationalId});
    try {
      List data = response.data["products"];
      List<CartModel> products = data
          .map(
            (e) => CartModel.fromJson(e),
          )
          .toList();
      return products;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}
