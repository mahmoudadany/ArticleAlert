abstract class AppCubitState {}

class InitialState extends AppCubitState {}

class DarkModeState extends AppCubitState {}

class BottomNavState extends AppCubitState {}

class NewsGetDataSuccessfulState extends AppCubitState {}

class NewsLoadingState extends AppCubitState {}

class NewsGetDataUnsuccessfulState extends AppCubitState {
  String error;
  NewsGetDataUnsuccessfulState(this.error);
}

class NewsGetSportsDataSuccessfulState extends AppCubitState {}

class NewsSportsLoadingState extends AppCubitState {}

class NewsGetSportsDataUnsuccessfulState extends AppCubitState {
  String error;
  NewsGetSportsDataUnsuccessfulState(this.error);
}
class NewsGetScienceDataSuccessfulState extends AppCubitState {}

class NewsScienceLoadingState extends AppCubitState {}

class NewsGetScienceDataUnsuccessfulState extends AppCubitState {
  String error;
  NewsGetScienceDataUnsuccessfulState(this.error);
}
