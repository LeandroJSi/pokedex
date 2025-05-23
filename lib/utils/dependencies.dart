import 'package:get_it/get_it.dart';
import 'package:http_interceptor/http/intercepted_http.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';
import 'package:logger/logger.dart';

import '../core/http/http_client.dart';
import '../core/http/http_client_impl.dart';
import '../core/http/http_interceptor_impl.dart';
import '../features/data/datasources/api/pokemon_datasource_impl.dart';
import '../features/data/datasources/pokemon_datasource.dart';
import '../features/data/repositories/pokemon_repository_impl.dart';
import '../features/domain/repositories/pokemon_repository.dart';
import '../features/domain/usecases/get_all_pokemons_user_case.dart';
import '../features/domain/usecases/get_pokemon_details_by_url_use_case.dart';
import 'app_logger.dart';
import 'app_logger_impl.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencyInjection() async {
  getIt.registerLazySingleton<AppLogger>(() => AppLoggerImpl(logger: Logger()));

  getIt.registerLazySingleton<InterceptorContract>(
        () => HttpInterceptorImpl(
      appLogger: getIt<AppLogger>(),
      apiUrl: 'https://pokeapi.co/',
    ),
  );

  getIt.registerLazySingleton<HttpClient>(
        () => HttpClientImpl(
      interceptedHttp: InterceptedHttp.build(
        interceptors: [HttpInterceptorImpl(appLogger: getIt<AppLogger>(), apiUrl: 'https://pokeapi.co/')],
        requestTimeout: const Duration(seconds: 30),
      ),
      apiUrl: 'https://pokeapi.co/',
    ),
  );
  getIt.registerLazySingleton<PokemonDataSource>(
        () => PokemonDataSourceImpl(getIt<HttpClient>()),
  );
  getIt.registerLazySingleton<PokemonRepository>(
        () => PokemonRepositoryImpl(getIt<PokemonDataSource>()),
  );
  getIt.registerLazySingleton<GetAllPokemonsUseCase>(
        () => GetAllPokemonsUseCase(getIt<PokemonRepository>()),
  );
  getIt.registerLazySingleton<GetPokemonDetailsByUrlUseCase>(
        () => GetPokemonDetailsByUrlUseCase(getIt<PokemonRepository>()),
  );
}
