import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/favorite/data/favorite_data.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);
  final FavoriteData favoriteData = FavoriteData();

  addFavoriteCubit({required String productId}) async {
    emit(FavoriteLoading());
    await favoriteData.addFavorite(productId: productId);
    emit(FavoriteSuccess());
  }

  getAllFavoriteCubit() async {
    emit(FavoriteLoading());
    var success = await favoriteData.getAllFavorite();
    emit(GetFavoriteSuccess(favList: success));
  }
}
