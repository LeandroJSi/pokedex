import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/routes.dart';
import '../../../utils/dependencies.dart';
import '../../domain/entities/pokemon_details.dart';
import '../cubit/pokemon_details/pokemon_details_cubit.dart';
import '../cubit/pokemon_details/pokemon_details_state.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final String pokemonName;
  final String url;

  const PokemonDetailsScreen({
    super.key,
    required this.pokemonName,
    required this.url,
  });

  String _toCamelCase(String name) {
    return name.split(RegExp(r'[- ]+')).map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonDetailsCubit(getIt())..fetchPokemonDetails(url),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(_toCamelCase(pokemonName)),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: BackButton(
                onPressed: () => context.go(RouteNames.pokemonList),
              ),
            ),
            extendBodyBehindAppBar: true,
            body: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
              builder: (context, state) {
                if (state is PokemonDetailsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PokemonDetailsLoaded) {
                  final PokemonDetails details = state.details;
                  final typeColor = _typeColor(details.types.first);
                  return Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          typeColor.withAlpha((0.8 * 255).toInt()),
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: kToolbarHeight + 50,
                        left: 16,
                        right: 16,
                        bottom: 32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            details.imageUrl,
                            width: 180,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '#${details.id.toString().padLeft(3, '0')}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            _toCamelCase(pokemonName),
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),

                          Wrap(
                            spacing: 8,
                            children: details.types
                                .map(
                                  (type) => Chip(
                                    label: Text(type.toUpperCase()),
                                    backgroundColor: typeColor,
                                    labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Height',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('${details.height} m'),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Weight',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('${details.weight} kg'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is PokemonDetailsError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }

  Color _typeColor(String type) {
    switch (type) {
      case 'grass':
        return Colors.green;
      case 'bug':
        return Colors.lightGreen.withAlpha((0.3 * 255).toInt());
      case 'fire':
        return const Color(0xFFB22222);
      case 'water':
        return Colors.blue;
      case 'electric':
        return Colors.yellow.shade700;
      case 'earth':
        return const Color(0xFFD2B48C);
      case 'rock':
        return const Color(0xFF313033);
      case 'poison':
        return const Color(0xFF800080);
      case 'flying':
        return Colors.grey.shade300;
      case 'fairy':
        return const Color(0xFFFFB6C1);
      case 'psychic':
        return const Color(0xFFFF1493);
      case 'steel':
        return const Color(0xFFB1AEB8);
      case 'fighting':
        return Colors.red;
      case 'ice':
        return Colors.lightBlue.shade100;
      case 'ghost':
        return const Color(0xFF352463);
      case 'dark':
        return const Color(0xFF252036);
      default:
        return const Color(0xFFBDB7AA);
    }
  }
}
