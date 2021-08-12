import 'package:equatable/equatable.dart';

abstract class WorkTicketPageState extends Equatable {
  @override
  List<Object> get props => [];
}

class WorkTicketPageInitialState extends WorkTicketPageState {}

class WorkTicketPageErrorState extends WorkTicketPageState {
  final String message;

  WorkTicketPageErrorState(this.message);
}

class WorkTicketPageSuccessState extends WorkTicketPageState {}
