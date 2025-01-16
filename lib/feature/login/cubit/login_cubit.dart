import 'package:bloc/bloc.dart';
import 'package:shopping_app/feature/login/model/data/login_data.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginData loginData = LoginData();

  loginCubit({required email, required password}) async {
    emit(LoginLoadingState());
    var success = await loginData.loginData(email: email, password: password);

    emit(LoginSuccessState(userData: success));
  }
}
