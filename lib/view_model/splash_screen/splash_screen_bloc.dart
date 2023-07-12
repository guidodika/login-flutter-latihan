import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../utils/constant.dart';
import '../../utils/shared_preferences_helper.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<CekStatusLogin>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 1000), () async {
        bool isLogin = await AppSharedPreferences.isUserLoggedIn();
        debugPrint("splash screen Checking Status Login = $isLogin");
        try {
          if (isLogin) {
            UserConfig.dataUser = await AppSharedPreferences.getUserProfile();
            emit(ScreenHome());
          } else {
            emit(ScreenLogin());
          }
        } catch (error) {
          emit(ScreenLogin());
          debugPrint("splash screen error$error");
        }
      });

    });
  }
}
