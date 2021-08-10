import 'package:acme_test/splashScreenPage/splashScreenRepository.dart';
import 'package:acme_test/splashScreenPage/splashScreenState.dart';
import 'package:bloc/bloc.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {

  final SplashScreenRepository repository;

  SplashScreenCubit({this.repository}) : super(SplashScreenInitialState());

  Future<void> start() async {
    emit(SplashScreenAnimationStartState("Iniciando Animación"));
    var eitherValue = await repository.initializeApp();

    eitherValue.fold(
          (failure) => emit(SplashScreenError(failure.properties.first)),
          (credentials) {
        emit(SplashScreenAppInitializedSuccess());
      },
    );
  }

  // Future<void> startAnimation()async {
  //   emit(SplashScreenAnimationStartState("Iniciando Animación"));
  // }


}