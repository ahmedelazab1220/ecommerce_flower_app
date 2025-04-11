import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/features/occasions/presentation/view/widgets/product_item.dart';
import 'package:ecommerce_flower_app/features/occasions/presentation/view_model/occasion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class ProductView extends StatefulWidget {
  final String occasionId;

  const ProductView({super.key, required this.occasionId});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
    // Trigger the API call only once
    context.read<OccasionCubit>().doIntent(
      ProductsRequestAction(widget.occasionId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OccasionCubit>();

    return BlocBuilder<OccasionCubit, OccasionState>(
      builder: (context, state) {
        if (state.baseState is BaseLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.baseState is BaseErrorState) {
          return Center(
            child: Text(
              (state.baseState as BaseErrorState).errorMessage,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        } else if (viewModel.products == null || viewModel.products!.isEmpty) {
          return Center(
            child: Text(
              LocaleKeys.NoProductAvailable.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }

        // Show products once fetched
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.w),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 17,
                mainAxisSpacing: 17,
                childAspectRatio: 0.7,
              ),
              itemCount: viewModel.products!.length,
              itemBuilder: (context, index) {
                final product = viewModel.products![index];
                return ProductItem(productEntity: product);
              },
            ),
          ),
        );
      },
    );
  }
}
