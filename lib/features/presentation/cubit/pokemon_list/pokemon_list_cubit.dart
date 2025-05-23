import 'package:pokedex_app/features/presentation/cubit/pokemon_list/pokemon_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_all_pokemons_user_case.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  final GetAllPokemonsUseCase getAllPokemons;

  PokemonListCubit(this.getAllPokemons) : super(PokemonListInitial());

  Future<void> fetchAll() async {
    emit(PokemonListLoading());
    try {
      final pokemons = await getAllPokemons();
      emit(PokemonListSuccess(pokemons));
    } catch (e) {
      emit(PokemonListError(e.toString()));
    }
  }
}