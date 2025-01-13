import 'package:dio/dio.dart';

class AuthData {
  final dio = Dio();

  postData(
      {required name,
      required email,
      required phone,
      required nationalId,
      required gender,
      required password,
      required token,
      required profileImage}) async {
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
      if (response.data != null) {
        print(error.response!.data);
        var errorMessage = error.response!.data;
        return errorMessage;
      }
    }
  }
}
