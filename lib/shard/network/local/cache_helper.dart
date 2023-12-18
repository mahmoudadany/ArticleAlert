import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences sharedPreferences;

  static  init()async{
    sharedPreferences= await SharedPreferences.getInstance();
  }

 static void setDarkModeState( bool mode)async{
   await sharedPreferences.setBool('darkmode', mode);
  }


 static bool? getDarkModeState(){
    return sharedPreferences.getBool('darkmode');
  }
}