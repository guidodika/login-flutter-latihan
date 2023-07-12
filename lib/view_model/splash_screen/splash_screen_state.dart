part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}
class ScreenLogin extends SplashScreenState {
  ScreenLogin();
}

class ScreenHome extends SplashScreenState {
  ScreenHome();
}
