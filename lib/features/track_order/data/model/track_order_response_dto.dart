import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class TrackOrderResponseDto {
  final String orderId;
  final int status;
  final String estimatedDeliveryDate;
  final String driverName;
  final String driverPhoneNumber;

  TrackOrderResponseDto({
    required this.orderId,
    required this.status,
    required this.estimatedDeliveryDate,
    required this.driverName,
    required this.driverPhoneNumber,
  });

  factory TrackOrderResponseDto.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return TrackOrderResponseDto(
      orderId: data['orderId'] ?? '',
      status: data['status'] ?? '',
      estimatedDeliveryDate: data['estimatedDeliveryDate'] ?? '',
      driverName: data['driverName'] ?? '',
      driverPhoneNumber: data['driverPhoneNumber'] ?? '',
    );
  }
}
