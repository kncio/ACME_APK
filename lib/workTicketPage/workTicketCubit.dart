import 'package:acme_test/workTicketPage/workTicketRepository.dart';
import 'package:acme_test/workTicketPage/workTicketState.dart';
import 'package:bloc/bloc.dart';

class WorkTicketPageCubit extends Cubit<WorkTicketPageState> {
  final WorkTicketRepository repository;

  WorkTicketPageCubit({this.repository}) : super(WorkTicketPageInitialState());

  Future<void> getWorkTicketById(int id) async {
    emit(WorkTicketPageLoadingState());

    var eitherValue = await repository.loadWorkTicketById(id);

    eitherValue.fold(
        (l) => emit(WorkTicketPageErrorState(l.properties.first)),
        (workTicketModel) => workTicketModel != null
            ? emit(WorkTicketPageSuccessState(workTicketModel))
            : emit(WorkTicketPageErrorState(
                "there is no workTicketWith id: $id")));
  }
}
