import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';

import '../../data/model/track_order_request_dto.dart';
import '../../data/model/track_order_response_dto.dart';

abstract class TrackOrderRepo {
  Stream<Result<TrackOrderResponseDto>> trackOrder(
    TrackOrderRequestDto request,
  );
}
