import 'package:flutter/material.dart';

import '../../../../home/domain/entity/product_entity.dart';
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
    final ProductEntity product =
        ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ImageView(product: product),
          ProductDetailsBody(product: product),
        ],
      ),
      bottomNavigationBar: const BottomButton(),
    );
  }
}
