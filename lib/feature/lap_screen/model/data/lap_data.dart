import 'package:dio/dio.dart';
import '../model/laptop_model.dart';

class LapData {
  Dio dio = Dio();

  getLapData() async {
    var response =
        await dio.get("https://elwekala.onrender.com/product/Laptops");
    try {
      if (response.statusCode == 200) {
        List data = response.data["product"];
        List<LaptopModel> lapList = data
            .map(
              (e) => LaptopModel.fromJson(e),
            )
            .toList();
        return lapList;
      }
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}
