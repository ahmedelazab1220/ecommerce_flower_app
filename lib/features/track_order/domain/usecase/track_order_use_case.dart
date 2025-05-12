import 'package:ecommerce_flower_app/features/track_order/domain/repo/track_order_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/datasource_excution/api_result.dart';
import '../../data/model/track_order_request_dto.dart';
import '../../data/model/track_order_response_dto.dart';

@injectable
class TrackOrderUseCase {
  TrackOrderRepo _trackOrderRepo;
  TrackOrderUseCase(this._trackOrderRepo);

  Stream<Result<TrackOrderResponseDto>> trackOrder(
    TrackOrderRequestDto request,
  ) async* {
    yield* _trackOrderRepo.trackOrder(request);
  }
}
