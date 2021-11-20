import 'package:equatable/equatable.dart';

class BoxSize extends Equatable {
  final String name;
  final String size;
  final String type;
  final String image;

  const BoxSize({
    required this.name,
    required this.size,
    required this.type,
    required this.image,
  });

  @override
  List<Object?> get props => [name, size, type, image];
}
