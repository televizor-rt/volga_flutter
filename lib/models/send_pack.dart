import 'package:equatable/equatable.dart';
import 'package:volga/models/box_size.dart';
import 'package:volga/models/models.dart';

class SendPack extends Equatable {
  final User? sender;
  final User? addressee;
  final BoxSize? size;
  final TransportType? type;
  final String? image;

  const SendPack({
    this.sender,
    this.addressee,
    this.size,
    this.type,
    this.image,
  });

  @override
  List<Object?> get props => [
    sender,
    addressee,
    size,
    type,
    image,
  ];
}
