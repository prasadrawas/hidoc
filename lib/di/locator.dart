import 'package:get_it/get_it.dart';
import 'package:hidoc/data/network/repositories/articles_repository.dart';
import 'package:hidoc/res/url_constants.dart';
import 'package:hidoc/screens/home/viewmodel/home_screen_view_model.dart';

import '../data/network/api_client/dio_client.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  /*----------------------services-------------*/
  getIt.registerLazySingleton(() => DioClient(baseUrl: baseUrl));

  /*----------------------repositories-------------*/
  getIt.registerLazySingleton(() => ArticleRepository(getIt<DioClient>()));

  /*----------------------viewmodels-------------*/
  getIt.registerLazySingleton(
      () => HomeScreenViewModel(getIt<ArticleRepository>()));
}
