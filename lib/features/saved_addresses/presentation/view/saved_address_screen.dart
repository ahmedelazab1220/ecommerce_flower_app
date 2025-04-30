import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/di/di.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import '../view_model/cubit/saved_address_cubit.dart';
import 'widgets/saved_address_body.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({super.key});

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends State<SavedAddressScreen> {
  final viewModel = getIt<SavedAddressCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.doIntent(GetSavedAddressesAction());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.SavedAddresses.tr())),
        body: const SavedAddressBody(),
      ),
    );
  }
}
