import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/features/address_details/data/models/response/address.dart';
import 'package:ecommerce_flower_app/features/address_details/presentation/view/widgets/address_details_body.dart';
import 'package:ecommerce_flower_app/features/address_details/presentation/view_model/address_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/address_details_state.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  final viewModel = getIt<AddressDetailsCubit>();
  // Example address for update case
  // In a real application, this would be passed from the previous screen with another type of data
  Address? address = const Address(
    id: '678a810d8fd67911809f51a8',
    street: '50 Zahraa Al Maadi',
    city: 'Cairo',
    lat: '29.964319',
    long: '31.302535',
    phone: '+201234567890',
    username: 'Ahmed',
  );
  @override
  void initState() {
    viewModel.doIntent(LoadCitiesAndAreasAction());
    viewModel.isUpdate = address != null;
    if (viewModel.isUpdate) {
      viewModel.doIntent(SetInitialAddressAction(address!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.Address.tr())),
        body: BlocListener<AddressDetailsCubit, AddressDetailsState>(
          listener: (context, state) {
            final addressDetailsState = state.addressDetailsState;
            if (addressDetailsState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            } else if (addressDetailsState is BaseSuccessState) {
              AppDialogs.hideLoading(context);
            } else if (addressDetailsState is BaseErrorState) {
              AppDialogs.hideLoading(context);
              AppDialogs.showFailureDialog(
                context,
                message: addressDetailsState.errorMessage,
              );
            }
          },
          child: const AddressDetailsBody(),
        ),
      ),
    );
  }
}
