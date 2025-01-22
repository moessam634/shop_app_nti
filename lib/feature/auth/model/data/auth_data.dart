import 'package:dio/dio.dart';
import 'package:shopping_app/core/helper/cache_data/cache_data.dart';

class AuthData {
  final Dio dio = Dio();

  loginData({required email, required password}) async {
    var response = await dio.post(
      "https://elwekala.onrender.com/user/login",
      data: {"email": email, "password": password},
    );
    try {
      var data = response.data;
      var token = data["user"]["token"];
      SharedPref.sharedPref!.setString("token", token);
      print(token);
      var nationalId = data["user"]["nationalId"];
       SharedPref.sharedPref!.setString("nationalId", nationalId);
      return data;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data);
        return error.response!.data;
      }
    }
  }

  registerData({
    required name,
    required email,
    required phone,
    required nationalId,
    required gender,
    required password,
    required token,
    required profileImage,
  }) async {
    var response =
        await dio.post("https://elwekala.onrender.com/user/register", data: {
      "name": name,
      "email": email,
      "phone": phone,
      "nationalId": nationalId,
      "gender": gender,
      "password": password,
      "token": token,
      "profileImage": profileImage
    });
    try {
      var data = response.data;
      return data;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data);
        return error.response!.data;
      }
    }
  }
}
