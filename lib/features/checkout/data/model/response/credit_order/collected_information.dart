import 'package:json_annotation/json_annotation.dart';

part 'collected_information.g.dart';

@JsonSerializable()
class CollectedInformation {
  @JsonKey(name: "shipping_details")
  final dynamic shippingDetails;

  CollectedInformation({this.shippingDetails});

  factory CollectedInformation.fromJson(Map<String, dynamic> json) {
    return _$CollectedInformationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CollectedInformationToJson(this);
  }
}
