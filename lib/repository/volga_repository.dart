import 'package:volga/models/models.dart';

abstract class VolgaRepository {
  List<BoxSize> get boxSizes;
  List<TransportType> get transportTypes;
}