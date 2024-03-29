import 'package:acme_test/commons/stringsValues.dart';
import 'package:acme_test/loginPage/loginDataModel.dart';
import 'package:acme_test/loginPage/loginRepository.dart';
import 'package:acme_test/loginPage/loginState.dart';
import 'package:bloc/bloc.dart';

///Control the login page states for UI changes and comunicate the UI events to the repo
class LoginPageCubit extends Cubit<LoginPageState> {
  final LoginPageRepository repository;

  LoginPageCubit({this.repository}) : super(LoginPageInitialState());

  Future<void> login(LoginData loginData) async {
    emit(LoginPageSendingState());
    var eitherValue = await repository.login(loginData);

    eitherValue.fold(
      (failure) => emit(LoginPageErrorState(failure.properties.first)),
      (credentials) => credentials != null
          ? emit(LoginPageSuccessState(credentials))
          : LoginPageErrorState("$loginErrorString"),
    );
  }
}
