import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/credit_order_entity/session_entity.dart';
import 'adaptive_pricing_dto.dart';
import 'automatic_tax_dto.dart';
import 'collected_information_dto.dart';
import 'custom_text_dto.dart';
import 'customer_details_dto.dart';
import 'invoice_creation_dto.dart';
import 'metadata_dto.dart';
import 'payment_method_configuration_details_dto.dart';
import 'payment_method_options_dto.dart';
import 'phone_number_collection_dto.dart';
import 'total_details_dto.dart';

part 'session_dto.g.dart';

@JsonSerializable()
class SessionDto {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "object")
  final String? object;
  @JsonKey(name: "adaptive_pricing")
  final AdaptivePricingDto? adaptivePricing;
  @JsonKey(name: "after_expiration")
  final dynamic afterExpiration;
  @JsonKey(name: "allow_promotion_codes")
  final dynamic allowPromotionCodes;
  @JsonKey(name: "amount_subtotal")
  final int? amountSubtotal;
  @JsonKey(name: "amount_total")
  final int? amountTotal;
  @JsonKey(name: "automatic_tax")
  final AutomaticTaxDto? automaticTax;
  @JsonKey(name: "billing_address_collection")
  final dynamic billingAddressCollection;
  @JsonKey(name: "cancel_url")
  final String? cancelUrl;
  @JsonKey(name: "client_reference_id")
  final String? clientReferenceId;
  @JsonKey(name: "client_secret")
  final dynamic clientSecret;
  @JsonKey(name: "collected_information")
  final CollectedInformationDto? collectedInformation;
  @JsonKey(name: "consent")
  final dynamic consent;
  @JsonKey(name: "consent_collection")
  final dynamic consentCollection;
  @JsonKey(name: "created")
  final int? created;
  @JsonKey(name: "currency")
  final String? currency;
  @JsonKey(name: "currency_conversion")
  final dynamic currencyConversion;
  @JsonKey(name: "custom_fields")
  final List<dynamic>? customFields;
  @JsonKey(name: "custom_text")
  final CustomTextDto? customText;
  @JsonKey(name: "customer")
  final dynamic customer;
  @JsonKey(name: "customer_creation")
  final String? customerCreation;
  @JsonKey(name: "customer_details")
  final CustomerDetailsDto? customerDetails;
  @JsonKey(name: "customer_email")
  final String? customerEmail;
  @JsonKey(name: "discounts")
  final List<dynamic>? discounts;
  @JsonKey(name: "expires_at")
  final int? expiresAt;
  @JsonKey(name: "invoice")
  final dynamic invoice;
  @JsonKey(name: "invoice_creation")
  final InvoiceCreationDto? invoiceCreation;
  @JsonKey(name: "livemode")
  final bool? livemode;
  @JsonKey(name: "locale")
  final dynamic locale;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "mode")
  final String? mode;
  @JsonKey(name: "payment_intent")
  final dynamic paymentIntent;
  @JsonKey(name: "payment_link")
  final dynamic paymentLink;
  @JsonKey(name: "payment_method_collection")
  final String? paymentMethodCollection;
  @JsonKey(name: "payment_method_configuration_details")
  final PaymentMethodConfigurationDetailsDto? paymentMethodConfigurationDetails;
  @JsonKey(name: "payment_method_options")
  final PaymentMethodOptionsDto? paymentMethodOptions;
  @JsonKey(name: "payment_method_types")
  final List<String>? paymentMethodTypes;
  @JsonKey(name: "payment_status")
  final String? paymentStatus;
  @JsonKey(name: "permissions")
  final dynamic permissions;
  @JsonKey(name: "phone_number_collection")
  final PhoneNumberCollectionDto? phoneNumberCollection;
  @JsonKey(name: "recovered_from")
  final dynamic recoveredFrom;
  @JsonKey(name: "saved_payment_method_options")
  final dynamic savedPaymentMethodOptions;
  @JsonKey(name: "setup_intent")
  final dynamic setupIntent;
  @JsonKey(name: "shipping_address_collection")
  final dynamic shippingAddressCollection;
  @JsonKey(name: "shipping_cost")
  final dynamic shippingCost;
  @JsonKey(name: "shipping_details")
  final dynamic shippingDetails;
  @JsonKey(name: "shipping_options")
  final List<dynamic>? shippingOptions;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "submit_type")
  final dynamic submitType;
  @JsonKey(name: "subscription")
  final dynamic subscription;
  @JsonKey(name: "success_url")
  final String? successUrl;
  @JsonKey(name: "total_details")
  final TotalDetailsDto? totalDetails;
  @JsonKey(name: "ui_mode")
  final String? uiMode;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "wallet_options")
  final dynamic walletOptions;

  SessionDto({
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

  factory SessionDto.fromJson(Map<String, dynamic> json) {
    return _$SessionDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SessionDtoToJson(this);
  }

  SessionEntity toEntity() => SessionEntity(
    id: id,
    object: object,
    adaptivePricing: adaptivePricing?.toEntity(),
    afterExpiration: afterExpiration,
    allowPromotionCodes: allowPromotionCodes,
    amountSubtotal: amountSubtotal,
    amountTotal: amountTotal,
    automaticTax: automaticTax?.toEntity(),
    billingAddressCollection: billingAddressCollection,
    cancelUrl: cancelUrl,
    clientReferenceId: clientReferenceId,
    clientSecret: clientSecret,
    collectedInformation: collectedInformation?.toEntity(),
    consent: consent,
    consentCollection: consentCollection,
    created: created,
    currency: currency,
    currencyConversion: currencyConversion,
    customFields: customFields,
    customText: customText?.toEntity(),
    customer: customer,
    customerCreation: customerCreation,
    customerDetails: customerDetails?.toEntity(),
    customerEmail: customerEmail,
    discounts: discounts,
    expiresAt: expiresAt,
    invoice: invoice,
    invoiceCreation: invoiceCreation?.toEntity(),
    livemode: livemode,
    locale: locale,
    metadata: metadata?.toEntity(),
    mode: mode,
    paymentIntent: paymentIntent,
    paymentLink: paymentLink,
    paymentMethodCollection: paymentMethodCollection,
    paymentMethodConfigurationDetails:
        paymentMethodConfigurationDetails?.toEntity(),
    paymentMethodOptions: paymentMethodOptions?.toEntity(),
    paymentMethodTypes: paymentMethodTypes,
    paymentStatus: paymentStatus,
    permissions: permissions,
    phoneNumberCollection: phoneNumberCollection?.toEntity(),
    recoveredFrom: recoveredFrom,
    savedPaymentMethodOptions: savedPaymentMethodOptions,
    setupIntent: setupIntent,
    shippingAddressCollection: shippingAddressCollection,
    shippingCost: shippingCost,
    shippingDetails: shippingDetails,
    shippingOptions: shippingOptions,
    status: status,
    submitType: submitType,
    subscription: subscription,
    successUrl: successUrl,
    totalDetails: totalDetails?.toEntity(),
    uiMode: uiMode,
    url: url,
    walletOptions: walletOptions,
  );
}
