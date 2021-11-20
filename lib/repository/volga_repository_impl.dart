import 'package:volga/models/box_size.dart';
import 'package:volga/models/transport_type.dart';
import 'package:volga/repository/repository.dart';

class VolgaRepositoryImpl extends VolgaRepository {
  @override
  List<BoxSize> get boxSizes => [
    BoxSize(
      image: 'assets/icons/small.png',
      name: 'Маленькая',
      size: 'Макс. 25 кг, 8 x 38 x 64 см',
      type: 'Конверт',
    ),
    BoxSize(
      image: 'assets/icons/medium.png',
      name: 'Средняя',
      size: 'Макс. 25 кг, 19 x 38 x 64 см',
      type: 'Коробка',
    ),
    BoxSize(
      image: 'assets/icons/large.png',
      name: 'Большая',
      size: 'Макс. 25 кг, 41 x 38 x 64 см',
      type: 'Большая коробка',
    ),
    BoxSize(
      image: 'assets/icons/xlarge.png',
      name: 'Очень большая',
      size: 'Макс.: 75 кг или 180 см',
      type: 'Без коробки',
    ),
  ];

  @override
  List<TransportType> get transportTypes => [
    TransportType(
      image: 'assets/icons/room.png',
      name: 'Багажное купе',
    ),
    TransportType(
      image: 'assets/icons/roomPass.png',
      name: 'Пассажирское купе',
    ),
  ];
}