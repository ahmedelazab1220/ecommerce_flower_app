import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_model.dart';

class PaymentCubit extends Cubit<Payment> {
  PaymentCubit()
    : super(
        Payment(method: 'Cash on delivery', subTotal: 100, deliveryFee: 10),
      );

  void updatePaymentMethod(String method) {
    emit(
      Payment(
        method: method,
        subTotal: state.subTotal,
        deliveryFee: state.deliveryFee,
        isGift: state.isGift,
        giftName: state.giftName,
        giftPhone: state.giftPhone,
      ),
    );
  }

  void toggleGift(bool isGift) {
    emit(
      Payment(
        method: state.method,
        subTotal: state.subTotal,
        deliveryFee: state.deliveryFee,
        isGift: isGift,
      ),
    );
  }
}
