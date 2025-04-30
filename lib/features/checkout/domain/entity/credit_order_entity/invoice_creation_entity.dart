import 'invoice_data_entity.dart';

class InvoiceCreationEntity {
  final bool? enabled;
  final InvoiceDataEntity? invoiceData;

  InvoiceCreationEntity({this.enabled, this.invoiceData});
}
