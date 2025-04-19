import 'occasion_entity.dart';

class OccasionResponseEntity {
  final String? message;
  final List<OccasionEntity>? occasions;

  OccasionResponseEntity({this.message, this.occasions});
}
