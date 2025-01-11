import 'package:bloc/bloc.dart';
import 'package:shopping_app/feature/home/model/data/home_product_data.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.endPoint}) : super(HomeInitial());
  HomeProductData homeProductData = HomeProductData();
  final String endPoint;

  getProduct() async {
    emit(HomeLoadingState());
    var data = await homeProductData.getProduct(endPoint: endPoint);
    emit(HomeSuccessState(products: data));
  }
}
