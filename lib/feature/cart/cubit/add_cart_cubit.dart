import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/add_cart_data/add_cart_data.dart';
import 'add_cart_state.dart';

class AddCartCubit extends Cubit<AddCartState> {
  AddCartCubit() : super(AddCartInitial());

  static AddCartCubit get(context) => BlocProvider.of(context);
  final AddCartData addCartData = AddCartData();

  addCartCubit({required String productId}) {
    emit(AddCartLoading());
    addCartData.addCartData(productId: productId);
    emit(AddCartSuccess());
  }

  getAllProductsCubit() {
    emit(AddCartLoading());
    var success = addCartData.getAllProducts();
    emit(GetProductsSuccess(products: success));
  }
}
