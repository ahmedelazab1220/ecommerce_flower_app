import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/track_order/data/model/track_order_request_dto.dart';
import 'package:ecommerce_flower_app/features/track_order/data/model/track_order_response_dto.dart';
import 'package:ecommerce_flower_app/features/track_order/domain/repo/track_order_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_source/contract/track_order_remote_data_source.dart';

@Injectable(as: TrackOrderRepo)
class TrackOrderRepoImpl implements TrackOrderRepo {
  final TrackOrderRemoteDataSource _trackOrderRemoteDataSource;
  TrackOrderRepoImpl(this._trackOrderRemoteDataSource);
  @override
  Stream<Result<TrackOrderResponseDto>> trackOrder(
    TrackOrderRequestDto request,
  ) async* {
    try {
      final response =
          await _trackOrderRemoteDataSource.trackOrder(request).first;
      yield SuccessResult(response);
    } catch (e) {
      yield FailureResult(Exception(e.toString()));
    }
  }
}
