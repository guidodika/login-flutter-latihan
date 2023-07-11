part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  final List<User> dataUser;
  final String status;
  const LoginState({required this.status, required this.dataUser});
}

class LoginInitial extends LoginState {
  LoginInitial() : super(dataUser: [], status: '');
}

class DataLogin extends LoginState {
  const DataLogin({required super.dataUser, required super.status});
}
