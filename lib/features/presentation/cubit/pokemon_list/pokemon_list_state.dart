import 'package:equatable/equatable.dart';
import '../../../domain/entities/pokemon_entity.dart';

abstract class PokemonListState extends Equatable {
  const PokemonListState();

  @override
  List<Object?> get props => [];
}

class PokemonListInitial extends PokemonListState {}

class PokemonListLoading extends PokemonListState {}

class PokemonListSuccess extends PokemonListState {
  final List<Pokemon> pokemons;

  const PokemonListSuccess(this.pokemons);

  @override
  List<Object?> get props => [pokemons];
}

class PokemonListError extends PokemonListState {
  final String message;

  const PokemonListError(this.message);

  @override
  List<Object?> get props => [message];
}