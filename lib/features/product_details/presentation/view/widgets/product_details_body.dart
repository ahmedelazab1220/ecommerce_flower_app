import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/shared_models/product_entity.dart';

class ProductDetailsBody extends StatelessWidget {
  final ProductEntity product;
  final emptyString = "";

  const ProductDetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${LocaleKeys.EGP} ${product.price ?? emptyString}",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${LocaleKeys.Status} ",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          LocaleKeys.InStock,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  LocaleKeys.AllPricesIncludeTax,
                  style: TextStyle(fontSize: 13.sp, color: AppColors.gray),
                ),
                const SizedBox(height: 8),
                Text(
                  "${product.title ?? emptyString}}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  LocaleKeys.Description,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description ?? emptyString,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                ),
                // const SizedBox(height: 24),
                // Text(
                //   "Bouquet include",
                //   style: TextStyle(
                //     fontSize: 16.sp,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(height: 8),
                // Text(
                //   "Pink roses:15",
                //   style: TextStyle(fontSize: 14.sp, color: Colors.black),
                // ),
                // const SizedBox(height: 4),
                // Text(
                //   "White wrap",
                //   style: TextStyle(fontSize: 14.sp, color: Colors.black),
                // ),
                // const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
