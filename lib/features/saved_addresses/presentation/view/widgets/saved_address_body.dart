import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/utils/routes/routes.dart';
import '../../view_model/cubit/saved_address_cubit.dart';
import 'handle_loading_address_state.dart';
import 'saved_address_list_item.dart';

class SavedAddressBody extends StatelessWidget {
  const SavedAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<SavedAddressCubit>();
    return CustomScrollView(
      slivers: [
        BlocBuilder<SavedAddressCubit, SavedAddressState>(
          builder: (context, state) {
            return state.getSavedAddressState is BaseLoadingState
                ? const HandleLoadingAddressState()
                : SavedAddressListItem(
                  savedAdress: viewModel.savedAddresses ?? [],
                );
          },
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.addressDetailsRoute);
              },
              child: Text(LocaleKeys.AddNewAddress.tr()),
            ),
          ),
        ),
      ],
    );
  }
}
