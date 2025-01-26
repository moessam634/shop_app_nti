import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/favorite/model/data/favorite_data.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);
  final FavoriteData favoriteData = FavoriteData();

  addFavoriteCubit({required String productId}) async {
    emit(FavoriteLoading());
    final success = await favoriteData.addFavorite(productId: productId);
    final message = success["message"];
    emit(FavoriteAddSuccess(message: message));
  }

  getAllFavoriteCubit() async {
    emit(FavoriteLoading());
    var success = await favoriteData.getAllFavorite();
    emit(GetFavoriteSuccess(favList: success));
  }

  deleteFavoriteCubit({required String productId}) async {
    emit(FavoriteLoading());
    var success = await favoriteData.deleteFavorite(productId: productId);
    final message = success["message"];
    emit(FavoriteDelete(message: message));
    getAllFavoriteCubit();
  }
}
