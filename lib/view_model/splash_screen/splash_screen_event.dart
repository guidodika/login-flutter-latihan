part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenEvent {}
class CekStatusLogin extends SplashScreenEvent{

}
class ClearSplashScreen extends SplashScreenEvent{}