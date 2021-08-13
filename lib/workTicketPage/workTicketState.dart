import 'package:acme_test/models/WorkTicketModel.dart';
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

class WorkTicketPageSuccessState extends WorkTicketPageState {
  final WorkTicketModel model;

  WorkTicketPageSuccessState(this.model);

}

class WorkTicketPageLoadingState extends WorkTicketPageState {}
