import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:project_two/src/data/core/api_client.dart';
import 'package:project_two/src/data/data_sources/language_local_data_source.dart';
import 'package:project_two/src/data/data_sources/movie_local_data_source.dart';
import 'package:project_two/src/data/data_sources/movie_remote_data_source.dart';
import 'package:project_two/src/data/repositories/app_repository_impl.dart';
import 'package:project_two/src/data/repositories/movie_repository_impl.dart';
import 'package:project_two/src/domain/repositories/app_repository.dart';
import 'package:project_two/src/domain/repositories/movie_repository.dart';
import 'package:project_two/src/domain/usecases/check_if_movie_favorite.dart';
import 'package:project_two/src/domain/usecases/delete_favorite_movie.dart';
import 'package:project_two/src/domain/usecases/get_cast.dart';
import 'package:project_two/src/domain/usecases/get_coming_soon.dart';
import 'package:project_two/src/domain/usecases/get_favorite_movies.dart';
import 'package:project_two/src/domain/usecases/get_movie_detail.dart';
import 'package:project_two/src/domain/usecases/get_playing_now.dart';
import 'package:project_two/src/domain/usecases/get_popular.dart';
import 'package:project_two/src/domain/usecases/get_preferred_language.dart';
import 'package:project_two/src/domain/usecases/get_trending.dart';
import 'package:project_two/src/domain/usecases/get_videos.dart';
import 'package:project_two/src/domain/usecases/save_movie.dart';
import 'package:project_two/src/domain/usecases/search_movies.dart';
import 'package:project_two/src/domain/usecases/update_language.dart';
import 'package:project_two/src/presentation/blocs/cast/cast_bloc.dart';
import 'package:project_two/src/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:project_two/src/presentation/blocs/language/language_bloc.dart';
import 'package:project_two/src/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:project_two/src/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:project_two/src/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:project_two/src/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:project_two/src/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:project_two/src/presentation/blocs/videos/videos_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(
    () => Client(),
  );

  getItInstance.registerLazySingleton<ApiClient>(
    () => ApiClient(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(),
  );

  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDataSourceImpl(),
  );

  getItInstance.registerLazySingleton<GetTrending>(
    () => GetTrending(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetPopular>(
    () => GetPopular(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetPlayingNow>(
    () => GetPlayingNow(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetComingSoon>(
    () => GetComingSoon(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetMovieDetail>(
    () => GetMovieDetail(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetCast>(
    () => GetCast(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<SearchMovies>(
    () => SearchMovies(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetVideos>(
    () => GetVideos(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<SaveMovie>(
    () => SaveMovie(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetFavoriteMovies>(
    () => GetFavoriteMovies(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
    () => DeleteFavoriteMovie(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<CheckIfFavoriteMovie>(
    () => CheckIfFavoriteMovie(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<UpdateLanguage>(
    () => UpdateLanguage(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<GetPreferredLanguage>(
    () => GetPreferredLanguage(
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      getItInstance(),
      getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
      getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieBackdropBloc(),
  );

  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieTabbedBloc(
      getPopular: getItInstance(),
      getComingSoon: getItInstance(),
      getPlayingNow: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      videosBloc: getItInstance(),
      favoriteBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => CastBloc(
      getCast: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => VideosBloc(
      getVideos: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => SearchMovieBloc(
      searchMovies: getItInstance(),
    ),
  );

  getItInstance.registerSingleton<LanguageBloc>(
    LanguageBloc(
      getPreferredLanguage: getItInstance(),
      updateLanguage: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => FavoriteBloc(
      checkIfFavoriteMovie: getItInstance(),
      deleteFavoriteMovie: getItInstance(),
      getFavoriteMovies: getItInstance(),
      saveMovie: getItInstance(),
    ),
  );
}
