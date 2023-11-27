import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tmdb_ui/core/network/network_info.dart';
import 'package:tmdb_ui/features/trending_movies/data/datasources/remote_data_sources.dart';
import 'package:tmdb_ui/features/trending_movies/data/repositories/movies_repo_impl.dart';
import 'package:tmdb_ui/features/trending_movies/domain/repositories/movies_repo.dart';
import 'package:tmdb_ui/features/trending_movies/domain/usecases/get_movies.dart';
import 'package:tmdb_ui/features/trending_movies/presentation/bloc/trending_movies_bloc.dart';

final getIt = GetIt.instance;

initDependencies() {
  // DATA SOURCES
  // ??
  getIt.registerLazySingleton<MoviesDataSource>(
      () => MoviesDataSourceImpl(dio: Dio()));

  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(getIt.get<InternetConnectionChecker>()));

// RESPOSITORIES
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(
        moviesDataSource: getIt<MoviesDataSource>(),
        networkInfo: getIt<NetworkInfo>(),
      ));

  //USE CASES
  getIt.registerSingleton<GetMovies>(
      GetMovies(repository: getIt<MoviesRepository>()));

// FACTORY OF BLOCS
// FACTORY OF BLOCS

  getIt.registerFactory(
      () => TrendingMoviesBloc(getMovies: getIt.get<GetMovies>()));
}
