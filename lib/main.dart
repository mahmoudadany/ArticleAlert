import 'package:articleaert/layout/article_app/cubit/cubit.dart';
import 'package:articleaert/layout/article_app/cubit/state.dart';
import 'package:articleaert/layout/article_app/home_layout.dart';
import 'package:articleaert/shard/network/local/cache_helper.dart';
import 'package:articleaert/shard/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  bool? shardValue = CacheHelper.getDarkModeState();
  runApp(MyApp(
    darkModeState: shardValue,
  ));
}

class MyApp extends StatelessWidget {
  bool? darkModeState;

  MyApp({this.darkModeState});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AppCubit()..getDate(darkMode: darkModeState),
      child: BlocConsumer<AppCubit, AppCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: AppCubit.get(context).darkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData(
                textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
                appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark),
                    backgroundColor: Colors.white,
                    titleTextStyle: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                ),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                )),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: HexColor('333739'),
                textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
                appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light),
                    backgroundColor: HexColor('333739'),
                    titleTextStyle: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    iconTheme: IconThemeData(color: Colors.white)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey[350],
                  backgroundColor: HexColor('333739'),
                ),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                )),
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
