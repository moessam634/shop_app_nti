import '../model/model/favorite_model.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteAddSuccess extends FavoriteState {
  final String message;

  FavoriteAddSuccess({required this.message});
}

final class FavoriteDelete extends FavoriteState {
  final String message;

  FavoriteDelete({required this.message});
}

final class GetFavoriteSuccess extends FavoriteState {
  final List<FavoriteModel> favList;

  GetFavoriteSuccess({required this.favList});
}
