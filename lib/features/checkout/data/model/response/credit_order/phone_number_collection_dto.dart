import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/phone_number_collection_entity.dart';

part 'phone_number_collection_dto.g.dart';

@JsonSerializable()
class PhoneNumberCollectionDto {
  @JsonKey(name: "enabled")
  final bool? enabled;

  PhoneNumberCollectionDto({this.enabled});

  factory PhoneNumberCollectionDto.fromJson(Map<String, dynamic> json) {
    return _$PhoneNumberCollectionDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PhoneNumberCollectionDtoToJson(this);
  }

  PhoneNumberCollectionEntity toEntity() {
    return PhoneNumberCollectionEntity(enabled: enabled);
  }
}
