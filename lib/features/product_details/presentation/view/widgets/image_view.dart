import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../home/domain/entity/product_entity.dart';

class ImageView extends StatefulWidget {
  final ProductEntity product;
  final emptyString = "";

  const ImageView({super.key, required this.product});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  int currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = widget.product.images ?? [];
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
                      widget.product.title ?? widget.emptyString,
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
                      setState(() => currentImageIndex = index);
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return CachedNetworkImage(
                      imageUrl: imageUrls[index],
                      fit: BoxFit.contain,
                      width: double.infinity,
                      placeholder:
                          (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
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
                                  currentImageIndex == entry.key
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
