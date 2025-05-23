import 'package:equatable/equatable.dart';

class PokemonDetails extends Equatable {
  final int id;
  final int height;
  final int weight;
  final List<String> types;
  final String imageUrl;

  const PokemonDetails({
    required this.id,
    required this.height,
    required this.weight,
    required this.types,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, height, weight, types, imageUrl];
}