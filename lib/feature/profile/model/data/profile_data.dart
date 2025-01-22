import 'package:dio/dio.dart';
import 'package:shopping_app/core/helper/cache_data/cache_data.dart';
import 'package:shopping_app/feature/profile/model/model/profile_model.dart';

var token = SharedPref.sharedPref!.get("token");

class ProfileData {
  Dio dio = Dio();

  profileUserData() async {
    var response = await dio.post("https://elwekala.onrender.com/user/profile",
        data: {"token": token});
    try {
      var responseData = response.data;
      var user = ProfileUserModel.fromJson(responseData);
      return user;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}
