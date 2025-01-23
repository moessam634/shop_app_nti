import '../model/favorite_model.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {}

final class FavoriteError extends FavoriteState {}

final class GetFavoriteSuccess extends FavoriteState {
  final List<FavoriteModel> favList;

  GetFavoriteSuccess({required this.favList});
}
