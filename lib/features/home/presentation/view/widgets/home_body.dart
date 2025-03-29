import 'package:flutter/material.dart';

import 'best_seller_list_items.dart';
import 'category_list_items.dart';
import 'home_app_bar.dart';
import 'occasion_list_items.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        HomeAppBar(),
        CategoryListItems(),
        BestSellerListItems(),
        OccasionListItems(),
      ],
    );
  }
}
