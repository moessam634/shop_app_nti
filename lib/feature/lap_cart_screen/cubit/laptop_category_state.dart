import '../model/model/laptop_model.dart';

sealed class LaptopCategoryState {}

final class LaptopCategoryInitial extends LaptopCategoryState {}

final class LaptopCategoryLoading extends LaptopCategoryState {}

final class LaptopCategorySuccess extends LaptopCategoryState {
  final List<LaptopModel> lapModelList;

  LaptopCategorySuccess({required this.lapModelList});
}
