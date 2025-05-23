import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/features/presentation/cubit/pokemon_details/pokemon_details_state.dart';

import '../../../domain/usecases/get_pokemon_details_by_url_use_case.dart';


class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  final GetPokemonDetailsByUrlUseCase getPokemonDetailsByUrl;

  PokemonDetailsCubit(this.getPokemonDetailsByUrl) : super(const PokemonDetailsInitial());

  Future<void> fetchPokemonDetails(String url) async {
    emit(const PokemonDetailsLoading());
    try {
      final parsedUrl = Uri.parse(url);
      final details = await getPokemonDetailsByUrl(parsedUrl.path);
      emit(PokemonDetailsLoaded(details));
    } catch (e) {
      emit(PokemonDetailsError('Erro ao buscar detalhes do Pokémon: $e'));
    }
  }
}