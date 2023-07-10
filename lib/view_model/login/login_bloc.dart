import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/shared_preferences_helper.dart';

import '../../model/user.dart';
import '../../utils/api_helper.dart';
import '../../utils/constant.dart';
import '../../utils/show_dialog_helper.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<PostLogin>((event, emit) async {
      ShowDialogHelper.showLoading();
      try {
        Map<String, dynamic> respon = await Api.postData(
            urlHttp: ApiConstants.apiLogin,
            username: event.username,
            password: event.password);
        if (respon['status'] == 'success') {
          Future.delayed(const Duration(seconds: 1), () async {
            ShowDialogHelper.dismissLoading();
          });
          Future.delayed(const Duration(seconds: 2), () async {
            ShowDialogHelper.showSuccess("Berhasil Login");
          });
          User dataLogin = User.fromJson(respon['data']);
          debugPrint("User Mobile ide");
          await AppSharedPreferences.setUserProfile(dataLogin);
          await AppSharedPreferences.setUserLoggedIn(true);
          UserConfig.dataUser = await AppSharedPreferences.getUserProfile();

          emit(DataLogin(
            dataUser: dataLogin,
            status: 'success',
            message: respon['message'],
          ));
        } else {
          Future.delayed(const Duration(seconds: 1), () async {
            ShowDialogHelper.showError("Gagal Login");
          });
          emit(DataLogin(
              dataUser: User(), status: 'failed', message: respon['message']));
        }
      } catch (error) {
        debugPrint("Error Login BloC: $error");
        emit(DataLogin(
            dataUser: User(),
            status: 'error',
            message: 'Pastikan piranti anda terhubung dengan internet'));
      }
    });
    on<LogoutApp>((event, emit) async {
      await AppSharedPreferences.setUserProfile(User());
      await AppSharedPreferences.setUserLoggedIn(false);
      UserConfig.dataUser = User();
      // TODO: implement event handler
    });
    on<ClearLogin>((event, emit) async {
      emit(LoginInitial());
    });
  }
}
