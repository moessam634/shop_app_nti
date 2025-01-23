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

  Future<List<CartModel>> getAllProducts() async {
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
    throw Exception("failed to success");
  }

  deleteProducts({required String productId}) async {
    var response = await dio.delete(
        "https://elwekala.onrender.com/cart/delete", data: {
      "nationalId": getNationalId,
      "productId": productId,
      "quantity": "1",
    });
    try {
      var data = response.data;
      return data;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}
