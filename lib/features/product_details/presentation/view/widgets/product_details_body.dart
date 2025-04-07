import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets/app_colors.dart';

class ProductDetailsBody extends StatelessWidget {
  final ProductsModel product;

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
                      "EGP ${product.products?[0].price ?? ''}",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Status: ",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("In Stock", style: TextStyle(fontSize: 16.sp)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "All prices include tax",
                  style: TextStyle(fontSize: 13.sp, color: AppColors.gray),
                ),
                const SizedBox(height: 8),
                Text(
                  "15 Pink Rose Bouquet",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.products?[0].description ?? '',
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
