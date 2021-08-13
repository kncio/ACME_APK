import 'package:acme_test/splashScreenPage/splashScreenRepository.dart';
import 'package:acme_test/splashScreenPage/splashScreenState.dart';
import 'package:bloc/bloc.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {

  final SplashScreenRepository repository;

  SplashScreenCubit({this.repository}) : super(SplashScreenInitialState());

  //Emit the SplashScreenAnimationStartState for start the animation
  Future<void> start() async {
    emit(SplashScreenAnimationStartState("Starting Animation"));
    var eitherValue = await repository.initializeApp();

    eitherValue.fold(
          (failure) => emit(SplashScreenError(failure.properties.first)),
          (credentials) {
        emit(SplashScreenAppInitializedSuccess());
      },
    );
  }

}