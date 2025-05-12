import 'package:ecommerce_flower_app/features/track_order/data/model/track_order_request_dto.dart';

import 'package:ecommerce_flower_app/features/track_order/data/model/track_order_response_dto.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../contract/track_order_remote_data_source.dart';

@Injectable(as: TrackOrderRemoteDataSource)
class TrackOrderRemoteDataSourceImpl implements TrackOrderRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;
  TrackOrderRemoteDataSourceImpl(this._firebaseFirestore);
  @override
  Stream<TrackOrderResponseDto> trackOrder(TrackOrderRequestDto request) {
    return _firebaseFirestore
        .collection('orders')
        .doc(request.orderId)
        .snapshots()
        .map((snapshot) {
          if (snapshot.exists) {
            return TrackOrderResponseDto.fromFirestore(snapshot);
          } else {
            throw Exception('Order not found');
          }
        });
  }
}
