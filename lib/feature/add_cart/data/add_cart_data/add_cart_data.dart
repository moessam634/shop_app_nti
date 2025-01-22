import 'package:dio/dio.dart';
import 'package:shopping_app/core/helper/cache_data/cache_data.dart';

class AddCartData {
  final Dio dio = Dio();
  var getNationalId = SharedPref.sharedPref!.get("nationalId");

  addCartData({required String productId}) async {
    var response = await dio.post(
      "https://elwekala.onrender.com/cart/add",
      data: {
        "nationalId": "30212151515896",
        "productId": "64666d3a91c71d884185b774",
        "quantity": "1"
      },
    );
    var repoData = response.data;
    print(repoData);
    return repoData; // مش محتاج ارجع حاجه هنا اضيف بس
  }
}
