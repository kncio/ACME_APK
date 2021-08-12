import 'package:acme_test/workTicketPage/workTicketRepository.dart';
import 'package:acme_test/workTicketPage/workTicketState.dart';
import 'package:bloc/bloc.dart';

class WorkTicketPageCubit extends Cubit<WorkTicketPageState> {
  final WorkTicketRepository repository;

  WorkTicketPageCubit({this.repository}) : super(WorkTicketPageInitialState());
}
