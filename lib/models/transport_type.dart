import 'package:equatable/equatable.dart';

class TransportType extends Equatable {
  final String name;
  final String image;

  const TransportType({
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [name, image];
}
