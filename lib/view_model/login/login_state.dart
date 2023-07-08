part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  final User dataUser;
  final String status;
  final String message;
  const LoginState({required this.status, required this.dataUser, required this.message});
}

class LoginInitial extends LoginState {
  LoginInitial() : super(status: '', dataUser: User(), message: '');
}

class DataLogin extends LoginState {
  const DataLogin({required User dataUser, required String status, required String message})
      : super(dataUser: dataUser, status: status, message: message);
}
