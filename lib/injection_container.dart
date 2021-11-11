
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:novalab_test/features/get_news/data/repository/news_repository_impl.dart';
import 'package:novalab_test/features/get_news/domain/repository/news_repository.dart';
import 'package:novalab_test/features/get_news/domain/usecase/news_usecase.dart';
import 'package:novalab_test/features/get_news/presentation/news_bloc/news_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/network_info/network_info.dart';
import 'features/get_news/data/data_sources/news_local_data_cource.dart';
import 'features/get_news/data/data_sources/news_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init()  async {


  /// features get News

  //Firebase
  await Firebase.initializeApp();


  // Bloc

  sl.registerFactory<NewsBloc>(() => NewsBloc(useCase: sl()));

  // Use cases

  sl.registerLazySingleton(() => GetNewsUseCase(repository: sl()));


  //repository


  sl.registerLazySingleton<NewsRepository>(
          () =>
              NewsRepositoryImpl(remoteDataSource: sl(),
              networkInfo: sl(),
              localDataSource: sl()
              ));

  // data sources


  sl.registerLazySingleton<NewsRemoteDataSource>(() =>
      NewsRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<NewsLocalDataSource>(() =>
     NewsLocalDataSourceImpl());

  //core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => InternetConnectionChecker());

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

 // sl.registerLazySingleton(() => Hive);
}