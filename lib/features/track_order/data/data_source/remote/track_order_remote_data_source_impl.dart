import 'package:ecommerce_flower_app/features/track_order/data/model/track_order_request_dto.dart';

import 'package:ecommerce_flower_app/features/track_order/data/model/track_order_response_dto.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

import '../contract/track_order_remote_data_source.dart';

class TrackOrderRemoteDataSourceImpl implements TrackOrderRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;
  TrackOrderRemoteDataSourceImpl(this._firebaseFirestore);
  @override
  Future<TrackOrderResponseDto> getOrderStatus(
    TrackOrderRequestDto request,
  ) async {
    final docSnapshot =
        await _firebaseFirestore
            .collection('orders')
            .doc(request.orderId)
            .get();

    if (docSnapshot.exists) {
      return TrackOrderResponseDto.fromFirestore(docSnapshot);
    } else {
      throw Exception('Order not found');
    }
  }
}
