import 'package:acme_test/getDirectionsPage/getDirectionsRepository.dart';
import 'package:acme_test/getDirectionsPage/getDirectionsState.dart';
import 'package:bloc/bloc.dart';

class GetDirectionsPageCubit extends Cubit<GetDirectionsPageState> {
  final GetDirectionsPageRepository repository;

  GetDirectionsPageCubit({this.repository})
      : super(GetDirectionsPageInitialState());
}
