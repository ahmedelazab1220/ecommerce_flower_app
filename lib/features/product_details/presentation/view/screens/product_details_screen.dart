import 'package:ecommerce_flower_app/core/utils/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/shared_models/product_entity.dart';
import '../../view_model/product_details_cubit.dart';
import '../widgets/bottom_button.dart';
import '../widgets/image_view.dart';
import '../widgets/product_details_body.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<ProductDetailsCubit>();
    final ProductEntity product =
        ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            ImageView(product: product),
            ProductDetailsBody(product: product),
          ],
        ),
        bottomNavigationBar: BottomButton(productId: product.id),
      ),
    );
  }
}
