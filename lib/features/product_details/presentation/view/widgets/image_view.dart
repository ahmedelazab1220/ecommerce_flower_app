import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/responsive_util/responsive_util.dart';

class ImageView extends StatefulWidget {
  final List<String> imageUrls;

  const ImageView({super.key, required this.imageUrls});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 400,
      collapsedHeight: 250,
      backgroundColor: AppColors.lightPink,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return FlexibleSpaceBar(
            background: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: ResponsiveUtil.getResponsiveHeightValue(
                      context,
                      tablet: 0.55,
                      largeMobile: 0.45,
                      mobile: 0.3,
                    ),
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() => _currentImageIndex = index);
                    },
                  ),
                  items: [
                    ...widget.imageUrls.map(
                      (e) => Container(
                        width: ResponsiveUtil.getResponsiveWidthValue(
                          context,
                          tablet: 0.3,
                          largeMobile: 0.6,
                          mobile: 0.9,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppColors.lightPink,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: e,
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          errorWidget:
                              (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        widget.imageUrls.asMap().entries.map((entry) {
                          return Container(
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  _currentImageIndex == entry.key
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
