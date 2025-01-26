import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/core/style/string_app.dart';
import 'package:shopping_app/core/widget/custom_app_bar.dart';
import 'package:shopping_app/feature/favorite/cubit/favorite_cubit.dart';
import 'package:shopping_app/feature/favorite/cubit/favorite_state.dart';
import 'package:shopping_app/feature/favorite/view/widget/favorite_item_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..getAllFavoriteCubit(),
      child: Scaffold(
        appBar: customAppBar(title: StringApp.favorite),
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
          if (state is GetFavoriteSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.favList.length,
              itemBuilder: (context, index) {
                return FavoriteItemCard(
                  productId: state.favList[index].id,
                  favoriteModel: state.favList[index],
                );
              },
            );
          } else {
            return SpinKitFadingCircle(
              color: Colors.grey,
            );
          }
        }),
      ),
    );
  }
}
