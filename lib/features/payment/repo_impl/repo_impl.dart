import '../data/data_model.dart';
import '../repo/repo.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  @override
  Payment getPaymentDetails() {
    String method = "defaultMethod";
    double subTotal = 0.0;
    double deliveryFee = 0.0; 
    return Payment(method: method, subTotal: subTotal, deliveryFee: deliveryFee);
  }
}
