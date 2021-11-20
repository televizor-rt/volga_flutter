import 'package:equatable/equatable.dart';

class TransportType extends Equatable {
  final String name;
  final String image;
  final String? train;

  const TransportType({
    required this.name,
    required this.image,
    this.train,
  });

  @override
  List<Object?> get props => [name, image, train];
}
