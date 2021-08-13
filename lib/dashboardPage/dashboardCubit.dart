import 'package:acme_test/dashboardPage/dashboardRepository.dart';
import 'package:bloc/bloc.dart';

import 'dashBoardState.dart';

class DashboardPageCubit extends Cubit<DashboardPageState> {
  final DashboardPageRepository repository;

  DashboardPageCubit({this.repository}) : super(LoginPageInitialState());

  ///Handle the UI events and fetch data from the repository
  Future<void> getTickets() async {
    emit(DashboardPageLoadingState());

    var either = await repository.loadStoredTickets();

    either.fold(
        (l) => emit(DashboardPageErrorState(l.properties.first)),
        (ticketList) => ticketList != null
            ? emit(DashboardPageSuccessState(ticketList))
            : emit(DashboardPageErrorState("Something went wrong!")));
  }

  ///Emit the event indicating the user wants to create a ticket
  Future<void> startCreateForm() async {
    emit(DashboardPageCreateState());
  }
}
