part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class PostLogin extends LoginEvent {
  final String username;
  final String password;
  PostLogin({required this.username, required this.password});
}

class LogoutApp extends LoginEvent {}

class ClearLogin extends LoginEvent {}
