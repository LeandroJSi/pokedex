import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/core/config/routes.dart';
import 'package:pokedex_app/features/presentation/pages/pokemon_list_screen.dart';
import 'package:pokedex_app/features/presentation/pages/splash_screen.dart';
import '../../features/presentation/cubit/pokemon_list/pokemon_list_cubit.dart';
import '../../features/presentation/pages/pokemon_details_screen.dart';
import '../../utils/dependencies.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _navigatorKey,
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      name: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteNames.pokemonList,
      name: RouteNames.pokemonList,
      builder: (context, state) => BlocProvider(
        key: UniqueKey(),
        create: (_) => PokemonListCubit(getIt())..fetchAll(),
        child: const PokemonListScreen(),
      ),
    ),
    GoRoute(
      path: RouteNames.pokemonDetails,
      name: RouteNames.pokemonDetails,
      pageBuilder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        final name = data['name'] as String;
        final url = data['url'] as String;
        return MaterialPage(
          child: PokemonDetailsScreen(pokemonName: name, url: url),
        );
      },
    ),
  ],
);