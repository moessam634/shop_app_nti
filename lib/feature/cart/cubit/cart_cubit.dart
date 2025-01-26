import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/cart/data/cart_data/cart_data.dart';
import 'cart_state.dart';

class AddCartCubit extends Cubit<AddCartState> {
  AddCartCubit() : super(AddCartInitial());

  static AddCartCubit get(context) => BlocProvider.of(context);
  final CartData data = CartData();

  addCartCubit({required String productId}) async {
    emit(AddCartLoading());
    final success = await data.addCartData(productId: productId);
    final message = success['message'];
    emit(AddCartSuccess(message: message));
  }

  getAllProductsCubit() async {
    emit(AddCartLoading());
    var success = await data.getAllProducts();
    emit(GetProductsSuccess(products: success));
  }

  deleteProduct({required String productId}) async {
    emit(AddCartLoading());
    await data.deleteProducts(productId: productId);
    emit(DeleteCartSuccess());
    getAllProductsCubit();
  }
}
