import 'adaptive_pricing_entity.dart';
import 'automatic_tax_entity.dart';
import 'collected_information_entity.dart';
import 'custom_text_entity.dart';
import 'customer_details_entity.dart';
import 'invoice_creation_entity.dart';
import 'metadata_entity.dart';
import 'payment_method_configuration_details_entity.dart';
import 'payment_method_options_entity.dart';
import 'phone_number_collection_entity.dart';
import 'total_details_entity.dart';

class SessionEntity {
  final String? id;
  final String? object;
  final AdaptivePricingEntity? adaptivePricing;
  final dynamic afterExpiration;
  final dynamic allowPromotionCodes;
  final int? amountSubtotal;
  final int? amountTotal;
  final AutomaticTaxEntity? automaticTax;
  final dynamic billingAddressCollection;
  final String? cancelUrl;
  final String? clientReferenceId;
  final dynamic clientSecret;
  final CollectedInformationEntity? collectedInformation;
  final dynamic consent;
  final dynamic consentCollection;
  final int? created;
  final String? currency;
  final dynamic currencyConversion;
  final List<dynamic>? customFields;
  final CustomTextEntity? customText;
  final dynamic customer;
  final String? customerCreation;
  final CustomerDetailsEntity? customerDetails;
  final String? customerEmail;
  final List<dynamic>? discounts;
  final int? expiresAt;
  final dynamic invoice;
  final InvoiceCreationEntity? invoiceCreation;
  final bool? livemode;
  final dynamic locale;
  final MetadataEntity? metadata;
  final String? mode;
  final dynamic paymentIntent;
  final dynamic paymentLink;
  final String? paymentMethodCollection;
  final PaymentMethodConfigurationDetailsEntity?
  paymentMethodConfigurationDetails;
  final PaymentMethodOptionsEntity? paymentMethodOptions;
  final List<String>? paymentMethodTypes;
  final String? paymentStatus;
  final dynamic permissions;
  final PhoneNumberCollectionEntity? phoneNumberCollection;
  final dynamic recoveredFrom;
  final dynamic savedPaymentMethodOptions;
  final dynamic setupIntent;
  final dynamic shippingAddressCollection;
  final dynamic shippingCost;
  final dynamic shippingDetails;
  final List<dynamic>? shippingOptions;
  final String? status;
  final dynamic submitType;
  final dynamic subscription;
  final String? successUrl;
  final TotalDetailsEntity? totalDetails;
  final String? uiMode;
  final String? url;
  final dynamic walletOptions;

  SessionEntity({
    this.id,
    this.object,
    this.adaptivePricing,
    this.afterExpiration,
    this.allowPromotionCodes,
    this.amountSubtotal,
    this.amountTotal,
    this.automaticTax,
    this.billingAddressCollection,
    this.cancelUrl,
    this.clientReferenceId,
    this.clientSecret,
    this.collectedInformation,
    this.consent,
    this.consentCollection,
    this.created,
    this.currency,
    this.currencyConversion,
    this.customFields,
    this.customText,
    this.customer,
    this.customerCreation,
    this.customerDetails,
    this.customerEmail,
    this.discounts,
    this.expiresAt,
    this.invoice,
    this.invoiceCreation,
    this.livemode,
    this.locale,
    this.metadata,
    this.mode,
    this.paymentIntent,
    this.paymentLink,
    this.paymentMethodCollection,
    this.paymentMethodConfigurationDetails,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.paymentStatus,
    this.permissions,
    this.phoneNumberCollection,
    this.recoveredFrom,
    this.savedPaymentMethodOptions,
    this.setupIntent,
    this.shippingAddressCollection,
    this.shippingCost,
    this.shippingDetails,
    this.shippingOptions,
    this.status,
    this.submitType,
    this.subscription,
    this.successUrl,
    this.totalDetails,
    this.uiMode,
    this.url,
    this.walletOptions,
  });
}
