import 'package:ecommerce_flower_app/core/assets/app_colors.dart';
import 'package:ecommerce_flower_app/features/product_details/presentation/view/screens/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductsModel product;
  late List<String> imageUrls;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    product = ModalRoute.of(context)?.settings.arguments as ProductsModel;
    imageUrls = product.products?[0].images ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                            product.products?[0].title ?? '',
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
                            setState(() => _currentImageIndex = index);
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
          ),
          SliverList(
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
                            "${product.products?[0].price ?? ''}",
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
                              Text(
                                "In Stock",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "All prices include tax",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.gray,
                        ),
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
                      const SizedBox(height: 24),
                      Text(
                        "Bouquet include",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: Container(
          height: 48.h,
          color: AppColors.white,
          child: ElevatedButton(
            onPressed: () {
              // Add to cart action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.pink,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
            ),
            child: Text("Add to Cart", style: TextStyle(fontSize: 16.sp)),
          ),
        ),
      ),
    );
  }
}
