import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/add_cart/data/add_cart_data/add_cart_data.dart';
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
}
