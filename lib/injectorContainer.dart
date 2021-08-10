import 'package:acme_test/splashScreenPage/splashScreenCubit.dart';
import 'package:acme_test/splashScreenPage/splashScreenRepository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {


  //region SplashScreen
  sl.registerFactory(() => SplashScreenCubit(repository: sl()));

  sl.registerFactory(() => SplashScreenRepository());
  //endregion
}