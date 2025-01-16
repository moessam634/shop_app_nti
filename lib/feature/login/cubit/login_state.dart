
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginSuccessState extends LoginState {
  final userData;
  LoginSuccessState({required this.userData});
}
