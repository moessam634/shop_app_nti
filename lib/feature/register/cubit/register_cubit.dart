import 'package:bloc/bloc.dart';
import '../model/data/auth_data.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(AuthInitial());
  AuthData authData = AuthData();

  postData(
      {required name,
      required email,
      required phone,
      required nationalId,
      required gender,
      required password,
      required token,
      required profileImage}) {
    emit(AuthLoadingState());
    authData.postData(
        name: name,
        email: email,
        phone: phone,
        nationalId: nationalId,
        gender: gender,
        password: password,
        token: token,
        profileImage: profileImage);
    emit(AuthSuccessState(userData: authData));
  }
}
