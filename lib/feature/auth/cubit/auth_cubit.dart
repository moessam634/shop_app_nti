import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import '../model/data/auth_data.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthData authData = AuthData();
  ImagePicker picker = ImagePicker();
  File? image;
  String? userImage;

  registerData({
    required name,
    required email,
    required phone,
    required nationalId,
    required gender,
    required password,
    required token,
  }) async {
    emit(AuthLoadingState());
    var success = await authData.registerData(
        name: name,
        email: email,
        phone: phone,
        nationalId: nationalId,
        gender: gender,
        password: password,
        token: token,
        profileImage: userImage);
    emit(AuthSuccessState(userData: success));
  }

  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Uint8List bytes = File(image!.path).readAsBytesSync();
      userImage = base64Encode(bytes);
      if (kDebugMode) {
        print("images=$userImage");
        emit(ChooseImageState());
      } else {
        if (kDebugMode) {
          print("no image selected");
        }
      }
    }
  }

  loginCubit({required email, required password}) async {
    emit(AuthLoadingState());
    var success = await authData.loginData(email: email, password: password);

    emit(AuthSuccessState(userData: success));
  }
}
