import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? sharedPref;

  static init() async {
    sharedPref = await SharedPreferences.getInstance();
  }
}
//set برجع قيمه بحفظ الداتاا
//get
