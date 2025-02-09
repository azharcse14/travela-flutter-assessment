part of '../../../../core/di/di_import_path.dart';

final injector = GetIt.instance;

Future<void> injectDependencies() async {
  ///==========================================================================
  ///================================== CORE ==================================
  ///==========================================================================
  injector.registerLazySingleton<Dio>(() {
    Dio dio = Dio(BaseOptions(
      connectTimeout: AppConstants.apiTimeOut, // Connection timeout
      receiveTimeout: AppConstants.apiTimeOut, // Response timeout
      sendTimeout: AppConstants.apiTimeOut, // Send timeout
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {

        options.headers[CONTENT_TYPE] = APPLICATION_JSON;
        options.headers[ACCEPT] = APPLICATION_JSON;
        handler.next(options);
      },
    ));


    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: false,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    return dio;
  });
  //NetworkInfo instance
  injector.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));


  ///==========================================================================
  ///================================ API SERVICE =============================
  ///==========================================================================

  injector.registerSingleton<ExploreApiService>(
    ExploreApiService(injector()),
  );

  ///==========================================================================
  ///=============================== DATA SOURCES =============================
  ///==========================================================================
  injector.registerLazySingleton<IExploreDataSource>(
    () => ExploreDataSource(
      apiService: injector(),
    ),
  );

  ///==========================================================================
  ///=============================== REPOSITORIES =============================
  ///==========================================================================

  injector.registerLazySingleton<IExploreRepository>(
    () => ExploreRepository(
      iDataSource: injector(),
      networkInfo: injector(),
    ),
  );

  ///==========================================================================
  ///================================= USE CASES ==============================
  ///==========================================================================

  injector.registerLazySingleton<CampaignsUseCase>(
    () => CampaignsUseCase(
      iRepository: injector(),
    ),
  );

  injector.registerLazySingleton<CampaignsItemListUseCase>(
    () => CampaignsItemListUseCase(
      iRepository: injector(),
    ),
  );

  ///============================================================================
  ///================================= BLOCS ====================================
  ///============================================================================


  injector.registerFactory<CampaignsBloc>(
    () => CampaignsBloc(
      useCase: injector(),
    ),
  );

  injector.registerFactory<CampaignsItemListBloc>(
    () => CampaignsItemListBloc(
      useCase: injector(),
    ),
  );
}
