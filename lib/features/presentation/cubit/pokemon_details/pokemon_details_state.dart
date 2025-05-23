import 'package:equatable/equatable.dart';

import '../../../domain/entities/pokemon_details.dart';

abstract class PokemonDetailsState extends Equatable {
  const PokemonDetailsState();

  @override
  List<Object?> get props => [];
}

class PokemonDetailsInitial extends PokemonDetailsState {
  const PokemonDetailsInitial();
}

class PokemonDetailsLoading extends PokemonDetailsState {
  const PokemonDetailsLoading();
}

class PokemonDetailsLoaded extends PokemonDetailsState {
  final PokemonDetails details;

  const PokemonDetailsLoaded(this.details);

  @override
  List<Object?> get props => [details];
}

class PokemonDetailsError extends PokemonDetailsState {
  final String message;

  const PokemonDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}