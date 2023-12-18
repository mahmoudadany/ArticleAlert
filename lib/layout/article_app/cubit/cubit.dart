import 'package:articleaert/components/constent/constent.dart';
import 'package:articleaert/layout/article_app/cubit/state.dart';
import 'package:articleaert/modules/business/business_screen.dart';
import 'package:articleaert/modules/science/science_screen.dart';
import 'package:articleaert/modules/sport/sport_screen.dart';
import 'package:articleaert/shard/network/local/cache_helper.dart';
import 'package:articleaert/shard/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(InitialState());
  bool darkMode = true;
  int currentIndex = 0;
  List<String> screenTitle = [
    'Business Article',
    'Sport Article',
    'Science Article',
  ];
  List<Widget> screenWidget = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sport"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: "science"),
  ];
  List<dynamic> business = [];
  List<dynamic> sport = [];
  List<dynamic> science = [];

  void onChangeMode({bool? shardValue}) {
    if (shardValue!= null) {
      darkMode = CacheHelper.getDarkModeState()!;
      emit(DarkModeState());
    } else {
      darkMode = !darkMode;
      CacheHelper.setDarkModeState(darkMode);
      emit(DarkModeState());
    }
  }

  void getDate({bool? darkMode}) {
    onChangeMode(shardValue: darkMode);
    getDateFromApi();
    getScienceDateFromApi();
    getSportDateFromApi();
  }

  void getsuccessful(List<Map> list) async {
    business = list;
  }

  void getDateFromApi() {
    emit(NewsLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(url: path, query: {
        'country': 'eg',
        'category': 'business',
        'apikey': apiKey,
      }).then((value) {
        business = value.data['articles'];
        print(value.data['articles'][1]['image'].toString());
        emit(NewsGetDataSuccessfulState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetDataUnsuccessfulState(onError.toString()));
      });
    }
  }

  void getScienceDateFromApi() {
    emit(NewsScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: path, query: {
        'country': 'eg',
        'category': 'science',
        'apikey': apiKey,
      }).then((value) {
        science = value.data['articles'];
        print(value.data['articles'][1]['title'].toString());
        emit(NewsGetScienceDataSuccessfulState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetScienceDataUnsuccessfulState(onError.toString()));
      });
    }
  }

  void getSportDateFromApi() {
    emit(NewsSportsLoadingState());
    if (sport.isEmpty) {
      DioHelper.getData(url: path, query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': apiKey,
      }).then((value) {
        sport = value.data['articles'];
        print(value.data['articles'][1]['image'].toString());
        emit(NewsGetSportsDataSuccessfulState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSportsDataUnsuccessfulState(onError.toString()));
      });
    }
  }

  static AppCubit get(context) => BlocProvider.of(context);

  void onBottomNavChange(int index) {
    currentIndex = index;

    emit(BottomNavState());
  }
}
