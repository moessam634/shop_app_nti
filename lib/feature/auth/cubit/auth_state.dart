sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final userData;

  AuthSuccessState({required this.userData});
}

final class ChooseImageState extends AuthState {}
