import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;
  final String imageURL;
  final List<String> types;
  final List<String> stats;
  final List<String> moves;

  const Pokemon({
    required this.name,
    required this.imageURL,
    required this.types,
    required this.stats,
    required this.moves,
  });

  @override
  List<Object?> get props => [
        name,
        imageURL,
        types,
        stats,
        moves,
      ];
}
