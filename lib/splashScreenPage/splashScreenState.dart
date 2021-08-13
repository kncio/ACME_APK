import 'package:equatable/equatable.dart';

abstract class SplashScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashScreenInitialState extends SplashScreenState {}

class SplashScreenAnimationStartState extends SplashScreenState {
  final String message;

  SplashScreenAnimationStartState(this.message);
}

class SplashScreenAppInitializedSuccess extends SplashScreenState {}

class SplashScreenError extends SplashScreenState {
  final String errorMessage;

  SplashScreenError(this.errorMessage);
}
