import '../data/model/cart_model.dart';

sealed class AddCartState {}

final class AddCartInitial extends AddCartState {}

final class AddCartLoading extends AddCartState {}

final class AddCartSuccess extends AddCartState {}

final class DeleteCartSuccess extends AddCartState {}

final class GetProductsSuccess extends AddCartState {
  final List<CartModel> products;

  GetProductsSuccess({required this.products});
}
