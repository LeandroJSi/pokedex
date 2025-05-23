import 'package:flutter/foundation.dart';

import '../../../core/errors/exceptions.dart';
import '../../domain/entities/pokemon_details.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_datasource.dart';
import '../models/pokemon_model.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource _remoteDataSource;

  const PokemonRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Pokemon>> getAllPokemon() async {
    try {
      final raw = await _remoteDataSource.fetchAllPokemonRaw();
      final models = await compute(_parseList, raw);
      return models;
    } catch (e) {
      throw RepositoryException('Falha ao buscar lista de Pokémons: \$e');
    }
  }

  @override
  Future<PokemonDetails> getPokemonDetailsByUrl(String url) async {
    final detailsModel = await _remoteDataSource.fetchPokemonDetailsByUrl(url);
    return detailsModel.toEntity();
  }
}

List<PokemonModel> _parseList(Map<String, dynamic> json) {
  final List results = json['results'] as List;
  return results.map((e) => PokemonModel.fromJson(e as Map<String, dynamic>)).toList();
}