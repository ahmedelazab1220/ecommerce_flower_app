import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/collected_information_entity.dart';

part 'collected_information_dto.g.dart';

@JsonSerializable()
class CollectedInformationDto {
  @JsonKey(name: "shipping_details")
  final dynamic shippingDetails;

  CollectedInformationDto({this.shippingDetails});

  factory CollectedInformationDto.fromJson(Map<String, dynamic> json) {
    return _$CollectedInformationDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CollectedInformationDtoToJson(this);
  }

  CollectedInformationEntity toEntity() =>
      CollectedInformationEntity(shippingDetails: shippingDetails);
}
