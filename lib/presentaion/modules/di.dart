import 'package:get_it/get_it.dart';
import 'package:image_searcher/data/apis/image_search_api.dart';
import 'package:image_searcher/data/apis/image_search_api_kakao.dart';
import 'package:image_searcher/data/db/image_dao.dart';
import 'package:image_searcher/data/db/image_dao_impl.dart';
import 'package:image_searcher/data/repositories/image_repository_impl.dart';
import 'package:image_searcher/data/repositories/local/image_local_data_source.dart';
import 'package:image_searcher/data/repositories/local/image_local_data_source_impl.dart';
import 'package:image_searcher/data/repositories/remote/image_remote_data_source.dart';
import 'package:image_searcher/data/repositories/remote/image_remote_data_source_impl.dart';
import 'package:image_searcher/domain/repositories/image_repository.dart';
import 'package:image_searcher/domain/usecases/delete_favorite_usecase.dart';
import 'package:image_searcher/domain/usecases/get_favorites_usecase.dart';
import 'package:image_searcher/domain/usecases/get_paging_images_usecase.dart';
import 'package:image_searcher/domain/usecases/insert_favorite_usecase.dart';
import 'package:image_searcher/presentaion/viewmodels/favorite_view_model.dart';
import 'package:image_searcher/presentaion/viewmodels/search_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ImageDao>(() => ImageDaoImpl.instance);
  locator.registerLazySingleton<ImageLocalDataSource>(() => ImageLocalDataSourceImpl(locator<ImageDao>()));

  locator.registerLazySingleton<ImageSearchApi>(() => ImageSearchApiKakao());
  locator.registerLazySingleton<ImageRemoteDataSource>(() => ImageRemoteDataSourceImpl(locator<ImageSearchApi>()));

  locator.registerLazySingleton<ImageRepository>(() => ImageRepositoryImpl(locator<ImageLocalDataSource>(), locator<ImageRemoteDataSource>()));

  locator.registerLazySingleton(() => GetPagingImagesUsecase(locator<ImageRepository>()));
  locator.registerLazySingleton(() => InsertFavoriteUsecase(locator<ImageRepository>()));
  locator.registerLazySingleton(() => DeleteFavoriteUsecase(locator<ImageRepository>()));
  locator.registerLazySingleton(() => GetFavoritesUsecase(locator<ImageRepository>()));

  locator.registerFactory(() => SearchViewModel(locator<GetPagingImagesUsecase>()));
  locator.registerFactory(() => FavoriteViewModel(
      locator<GetFavoritesUsecase>(),
      locator<InsertFavoriteUsecase>(),
      locator<DeleteFavoriteUsecase>()));
}