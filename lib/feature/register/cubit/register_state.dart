
sealed class RegisterState {}

final class AuthInitial extends RegisterState {}

final class AuthLoadingState extends RegisterState {}

final class AuthSuccessState extends RegisterState {
  final  userData;
  AuthSuccessState({required this.userData});
}
final class ChooseImageState extends RegisterState {}
