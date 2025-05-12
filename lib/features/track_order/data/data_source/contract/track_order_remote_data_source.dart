import '../../model/track_order_request_dto.dart';
import '../../model/track_order_response_dto.dart';

abstract class TrackOrderRemoteDataSource {
  Future<TrackOrderResponseDto> getOrderStatus(TrackOrderRequestDto request);
}
