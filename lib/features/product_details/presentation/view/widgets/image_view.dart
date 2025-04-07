import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flower_app/core/assets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets/app_colors.dart';

class ImageView extends StatefulWidget {
  final ProductsModel product;
  int currentImageIndex = 0;

  ImageView({super.key, required this.product});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = widget.product.products?[0].images ?? [];
    return SliverAppBar(
      pinned: true,
      expandedHeight: 400.h,
      backgroundColor: AppColors.lightPink,
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final collapsedHeight =
              kToolbarHeight + MediaQuery.of(context).padding.top + 50;
          final isCollapsed = constraints.maxHeight <= collapsedHeight;
          return FlexibleSpaceBar(
            centerTitle: true,
            title:
                isCollapsed
                    ? Text(
                      widget.product.products?[0].title ?? '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    : null,
            background: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider.builder(
                  itemCount: imageUrls.length,
                  options: CarouselOptions(
                    height: 400.h,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() => widget.currentImageIndex = index);
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return Image.network(
                      imageUrls[index],
                      fit: BoxFit.contain,
                      width: double.infinity,
                    );
                  },
                ),
                Positioned(
                  bottom: 12.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        imageUrls.asMap().entries.map((entry) {
                          return Container(
                            width: 8.w,
                            height: 8.w,
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  widget.currentImageIndex == entry.key
                                      ? AppColors.pink
                                      : AppColors.lightGray,
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
