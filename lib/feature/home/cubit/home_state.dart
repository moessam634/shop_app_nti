
import '../model/model/home_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  List<HomeModel> products;
  HomeSuccessState({required this.products});
}

final class HomeFailureState extends HomeState {}
final class HomeUpdateAppBarTitleState extends HomeState {}
