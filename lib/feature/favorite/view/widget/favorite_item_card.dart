import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/core/style/text_style.dart';
import 'package:shopping_app/core/widget/custom_snack_bar.dart';
import 'package:shopping_app/feature/favorite/cubit/favorite_cubit.dart';
import 'package:shopping_app/feature/favorite/cubit/favorite_state.dart';
import 'package:shopping_app/feature/favorite/model/model/favorite_model.dart';
import '../../../../core/style/size_app.dart';

class FavoriteItemCard extends StatelessWidget {
  final FavoriteModel favoriteModel;
  final String productId;

  const FavoriteItemCard({
    super.key,
    required this.productId,
    required this.favoriteModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: SizeApp.s16.w, vertical: SizeApp.s8.h),
      child: Padding(
        padding: const EdgeInsets.all(SizeApp.s16),
        child: Row(
          spacing: SizeApp.s16.w,
          children: [
            CachedNetworkImage(
              imageUrl: favoriteModel.image,
              placeholder: (context, url) => SpinKitFadingCircle(
                color: Colors.grey,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: SizeApp.s80.h,
              width: SizeApp.s80.w,
              fit: BoxFit.cover,
            ),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favoriteModel.name,
                    style: bold16(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    favoriteModel.description,
                    style: grey14(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: SizeApp.s8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${favoriteModel.price.toStringAsFixed(2)}",
                        style: green14(),
                      ),
                      IconButton(
                        onPressed: () async {
                          await FavoriteCubit.get(context)
                              .deleteFavoriteCubit(productId: productId);
                          if (context.mounted) {
                            final state = FavoriteCubit.get(context).state;
                            if (state is FavoriteDelete) {
                              customSnackBar(
                                  context: context, text: state.message);
                            }
                          }
                        },
                        icon: Icon(Icons.delete),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
