import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/data/lap_data.dart';
import 'laptop_category_state.dart';

class LaptopCategoryCubit extends Cubit<LaptopCategoryState> {
  LaptopCategoryCubit() : super(LaptopCategoryInitial());

  // static LaptopCategoryCubit get(context) => BlocProvider.of(context);
  final LapData lapData = LapData();

  getLapCubit() async {
    emit(LaptopCategoryLoading());
    var success = await lapData.getLapData();
    emit(LaptopCategorySuccess(lapModelList: success));
  }
}
