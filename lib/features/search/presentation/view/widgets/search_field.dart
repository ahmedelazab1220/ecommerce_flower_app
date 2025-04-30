import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/search/presentation/view_model/search_cubit.dart';
import 'package:ecommerce_flower_app/features/search/presentation/view_model/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  static Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    final SearchCubit searchCubit = context.read<SearchCubit>();
    return TextFormField(
      controller: searchCubit.searchController,
      onChanged: (value) {
        _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 300), () {
          context.read<SearchCubit>().doIntent(SearchRequestAction(value));
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16, right: 16),
        hintText: LocaleKeys.Search.tr(),
        hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: AppColors.white[AppColors.colorCode70],
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.white[AppColors.colorCode70]!,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            if (searchCubit.searchController.text.isNotEmpty) {
              searchCubit.searchController.clear();
              searchCubit.doIntent(
                SearchRequestAction(searchCubit.searchController.text),
              );
            }
          },
          icon: Icon(
            Icons.clear,
            color: AppColors.white[AppColors.colorCode70]!,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.white[AppColors.colorCode70]!,
          ),
        ),
      ),
    );
  }
}
