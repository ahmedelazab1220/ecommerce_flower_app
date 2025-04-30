import 'dart:ffi';

import 'package:ecommerce_flower_app/features/home/data/models/response/best_seller_dto.dart';
import 'package:ecommerce_flower_app/features/home/data/models/response/category_dto.dart';
import 'package:ecommerce_flower_app/features/home/data/models/response/home_response_dto.dart';
import 'package:ecommerce_flower_app/features/home/data/models/response/occasion_dto.dart';
import 'package:ecommerce_flower_app/features/home/data/models/response/product_dto.dart';

import '../../../../constants_factory.dart';

class HomeModelFactory {
  HomeModelFactory._();
  static const imageUrl =
      "https://gratisography.com/wp-content/uploads/2025/03/gratisography-funny-dog-1036x780.jpg";
  static DateTime datetime = DateTime.parse("2024-11-18T12:36:18.366Z");

  /// Returns a [HomeResponseDto] with all fields filled in.
  ///
  /// This is useful for testing success cases where the API returns a valid response.
  static HomeResponseDto success() => HomeResponseDto(
    message: ConstantsFactory.successMessage,
    products: [product()],
    categories: [category()],
    bestSeller: [bestSeller()],
    occasions: [occasion()],
  );

  /// Returns a [HomeResponseDto] with empty fields.
  ///
  /// This is useful for testing cases where the API returns an empty response.
  /// It can also be used to test the behavior of the app when no data is available.
  static HomeResponseDto empty() => HomeResponseDto(
    message: '',
    products: [],
    categories: [],
    bestSeller: [],
    occasions: [],
  );

  /// Returns a [HomeResponseDto] with intentionally malformed/invalid data
  ///
  /// This is useful for testing error handling when the API returns invalid data
  /// that doesn't match the expected schema or contains null values where they
  /// shouldn't be
  static HomeResponseDto malformed() => HomeResponseDto(
    message: null, // Should be non-null String
    products: [
      ProductDto(
        id: null, // Should be non-null String
        title: null, // Should be non-null String
        slug: "wedding-flower",
        description: "This is a Pack of White Wedding Flowers",
        imgCover: "invalid-url", // Invalid URL format
        images: [nullptr as String], // Should be non-null List
        price: -100, // Negative price
        priceAfterDiscount: -200, // Negative and greater than original price
        quantity: -50, // Negative quantity
        category: "3",
        occasion: "3",
        createdAt: datetime.add(const Duration(days: 1)), // Future date
        updatedAt: datetime.add(const Duration(days: 2)), // Future date
        v: 0,
        discount: 150, // Discount > 100%
        sold: -10, // Negative sold count
        rateAvg: 6.0, // Rating > 5.0
        rateCount: -5, // Negative count
        productId: null, // Should be non-null String
      ),
    ],
    categories: [
      CategoryDto(
        id: null, // Should be non-null String
        name: null, // Should be non-null String
        slug: null, // Should be non-null String
        image: "invalid-url", // Invalid URL format
        createdAt: datetime.add(const Duration(days: 1)), // Future date
        updatedAt: datetime.add(const Duration(days: 2)), // Future date
      ),
    ],
    bestSeller: [
      BestSellerDto(
        id: null, // Should be non-null String
        title: null, // Should be non-null String
        slug: "wedding-flower",
        description: "This is a Pack of White Wedding Flowers",
        imgCover: "invalid-url", // Invalid URL format
        images: null, // Should be non-null List
        price: -100, // Negative price
        priceAfterDiscount: -200, // Negative and greater than original price
        quantity: -50, // Negative quantity
        category: "2",
        occasion: "3",
        createdAt: datetime.add(const Duration(days: 1)), // Future date
        updatedAt: datetime.add(const Duration(days: 2)), // Future date
        v: 0,
        discount: 150, // Discount > 100%
        sold: -10, // Negative sold count
        rateAvg: 6.0, // Rating > 5.0
        rateCount: -5, // Negative count
      ),
    ],
    occasions: [
      OccasionDto(
        id: null, // Should be non-null String
        name: null, // Should be non-null String
        slug: null, // Should be non-null String
        image: "invalid-url", // Invalid URL format
        createdAt: datetime.add(const Duration(days: 1)), // Future date
        updatedAt: datetime.add(const Duration(days: 2)), // Future date
      ),
    ],
  );

  static ProductDto product() => ProductDto(
    id: "1",
    title: "Wedding Flower",
    slug: "wedding-flower",
    description: "This is a Pack of White Wedding Flowers",
    imgCover: imageUrl,
    images: [imageUrl, imageUrl],
    price: 440,
    priceAfterDiscount: 100,
    quantity: 3984,
    category: "3",
    occasion: "3",
    createdAt: datetime,
    updatedAt: datetime,
    v: 0,
    discount: 50,
    sold: 678,
    rateAvg: 3.5,
    rateCount: 30,
    productId: "1",
  );

  static CategoryDto category() => CategoryDto(
    id: "1",
    name: "flowers",
    slug: "flowers",
    image: imageUrl,
    createdAt: datetime,
    updatedAt: datetime,
  );

  static BestSellerDto bestSeller() => BestSellerDto(
    id: "1",
    title: "Wedding Flower",
    slug: "wedding-flower",
    description: "This is a Pack of White Wedding Flowers",
    imgCover: imageUrl,
    images: [imageUrl, imageUrl],
    price: 440,
    priceAfterDiscount: 100,
    quantity: 3984,
    category: "2",
    occasion: "3",
    createdAt: datetime,
    updatedAt: datetime,
    v: 0,
    discount: 50,
    sold: 678,
    rateAvg: 3.5,
    rateCount: 30,
  );

  static OccasionDto occasion() => OccasionDto(
    id: "1",
    name: "Wedding",
    slug: "wedding",
    image: imageUrl,
    createdAt: datetime,
    updatedAt: datetime,
  );
}
