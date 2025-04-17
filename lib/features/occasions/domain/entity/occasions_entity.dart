class OccasionsEntity {
  String? message;
  List<OccasionEntity>? occasions;

  OccasionsEntity({this.message, this.occasions});
}

class OccasionEntity {
  String? id;
  String? name;

  OccasionEntity({this.id, this.name});
}
