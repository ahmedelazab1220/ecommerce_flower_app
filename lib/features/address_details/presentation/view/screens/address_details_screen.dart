import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_dialogs.dart';
import 'package:ecommerce_flower_app/core/utils/dialogs/app_toast.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:ecommerce_flower_app/core/utils/routes/routes.dart';
import 'package:ecommerce_flower_app/features/address_details/presentation/view/widgets/address_details_body.dart';
import 'package:ecommerce_flower_app/features/address_details/presentation/view_model/address_details_cubit.dart';
import 'package:ecommerce_flower_app/features/saved_addresses/domain/entity/address_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/address_details_state.dart';

class AddressDetailsScreen extends StatefulWidget {
  final AddressEntity? address;
  const AddressDetailsScreen({super.key, this.address});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  final viewModel = getIt<AddressDetailsCubit>();
  @override
  void initState() {
    viewModel.doIntent(LoadCitiesAndAreasAction());
    viewModel.isUpdate = widget.address != null;
    if (viewModel.isUpdate) {
      viewModel.doIntent(SetInitialAddressAction(widget.address!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.Address.tr()), titleSpacing: 0),
        body: BlocListener<AddressDetailsCubit, AddressDetailsState>(
          listener: (context, state) {
            final addressDetailsState = state.addressDetailsState;
            if (addressDetailsState is BaseLoadingState) {
              AppDialogs.showLoadingDialog(context);
            } else if (addressDetailsState is BaseSuccessState) {
              AppDialogs.hideLoading(context);
              showToast(
                title:
                    viewModel.isUpdate
                        ? LocaleKeys.AddressUpdatedSuccessfully.tr()
                        : LocaleKeys.AddressAddedSuccessfully.tr(),
                color: AppColors.successGreen,
              );
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.savedAddressRoute,
              );
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
