import 'package:acme_test/models/ListTileTicketModel.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardPageState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginPageInitialState extends DashboardPageState {}

class DashboardPageErrorState extends DashboardPageState {
  final String message;

  DashboardPageErrorState(this.message);
}

class DashboardPageSuccessState extends DashboardPageState {
  final List<ListTileTicketModel> ticketList;

  DashboardPageSuccessState(this.ticketList);
}

class DashboardPageLoadingState extends DashboardPageState {}

class DashboardPageCreateState extends DashboardPageState {

}