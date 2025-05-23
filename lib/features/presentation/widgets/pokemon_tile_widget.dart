import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/routes.dart';
import '../../domain/entities/pokemon_entity.dart';

class PokemonTile extends StatelessWidget {
  final Pokemon pokemon;
  final String imageUrl;

  const PokemonTile({super.key, required this.pokemon, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.4;

    String toCamelCase(String name) {
      return name.split(RegExp(r'[- ]+')).map((word) {
        if (word.isEmpty) return '';
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }).join();
    }

    return GestureDetector(
      onTap: () {
        context.push(
          RouteNames.pokemonDetails,
          extra: {'name': pokemon.name, 'url': pokemon.url},
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: width,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                imageUrl,
                width: width * 0.7,
                height: width * 0.7,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              Text(
                toCamelCase(pokemon.name),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
