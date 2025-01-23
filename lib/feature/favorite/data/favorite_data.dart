import 'package:dio/dio.dart';
import 'package:shopping_app/feature/cart/data/add_cart_data/add_cart_data.dart';
import 'package:shopping_app/feature/favorite/model/favorite_model.dart';

class FavoriteData {
   Dio dio = Dio();

  addFavorite({required String productId}) async {
    var response = await dio.post("https://elwekala.onrender.com/favorite",
        data: {"nationalId": getNationalId, "productId": productId});
    var data = response.data;
    print(data);
    return data;
  }

   getAllFavorite() async {
    var response = await dio.get("https://elwekala.onrender.com/favorite",
        data: {"nationalId": getNationalId});
    try {
      List data = response.data["favoriteProducts"];
      List<FavoriteModel> favList = data
          .map(
            (e) => FavoriteModel.fromJson(e),
          )
          .toList();
      print(favList);
      return favList;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data);
      }
    }
  }
}
