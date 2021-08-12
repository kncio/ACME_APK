import 'package:equatable/equatable.dart';

abstract class GetDirectionsPageState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDirectionsPageInitialState extends GetDirectionsPageState {}

class GetDirectionsPageErrorState extends GetDirectionsPageState {
  final String message;

  GetDirectionsPageErrorState(this.message);
}

class GetDirectionsPageSuccessState extends GetDirectionsPageState {}
