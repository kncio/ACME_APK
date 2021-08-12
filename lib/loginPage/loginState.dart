import 'package:equatable/equatable.dart';

abstract class LoginPageState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginPageInitialState extends LoginPageState {}

class LoginPageSendingState extends LoginPageState {}

class LoginPageErrorState extends LoginPageState {
  final String message;

  LoginPageErrorState(this.message);
}

class LoginPageSuccessState extends LoginPageState {}
