import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/shared_models/product_entity.dart';
import '../../view_model/product_details_cubit.dart';
import '../widgets/bottom_button.dart';
import '../widgets/image_view.dart';
import '../widgets/product_details_body.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final viewModel = getIt<ProductDetailsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: CustomScrollView(
          controller: viewModel.scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            ImageView(imageUrls: widget.productEntity.images ?? []),
            SliverList(
              delegate: SliverChildListDelegate([
                ProductDetailsBody(product: widget.productEntity),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: BottomButton(productId: widget.productEntity.id),
      ),
    );
  }
}
