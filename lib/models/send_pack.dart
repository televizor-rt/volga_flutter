import 'package:equatable/equatable.dart';
import 'package:volga/models/box_size.dart';
import 'package:volga/models/models.dart';

class SendPack extends Equatable {
  final User? user;
  final BoxSize? size;
  final TransportType? type;

  const SendPack({
    this.user,
    this.size,
    this.type,
  });

  @override
  List<Object?> get props => [
    user,
    size,
    type,
  ];
}
