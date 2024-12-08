import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/base/images.dart';
import 'package:food_footprint/data/alternatives_data.dart';
import 'package:food_footprint/data/product_information_data.dart';
import 'package:food_footprint/ui/body_screen/details_screen/product_details.dart';
import 'package:food_footprint/ui/data_storage.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, dynamic>> localProductInformation = [];
  List<Map<String, dynamic>> localAlternatives = [];
  final Map<String, Color> categoryColors = {};

  @override
  void initState() {
    super.initState();
    _initializeData();
    _initializeAlternatives();
  }

  Future<void> _initializeData() async {
    final hasData = await DataStorage.hasProductInformation();
    if (!hasData) {
      await DataStorage.saveProductInformation(productInformation);
    }

    final data = await DataStorage.getProductInformation();

    setState(() {
      localProductInformation = data ?? [];
    });
  }

  Future<void> _toggleFavorite(String category, String productName) async {
    await DataStorage.toggleFavorite(category, productName);

    final updatedData = await DataStorage.getProductInformation();

    setState(() {
      localProductInformation =
          List<Map<String, dynamic>>.from(updatedData ?? []);
    });
  }

  Future<void> _initializeAlternatives() async {
    final hasData = await DataStorage.hasAlternatives();
    if (!hasData) {
      await DataStorage.saveAlternatives(alternatives);
    }

    final data = await DataStorage.getAlternatives();

    setState(() {
      localAlternatives = (data as List).map((category) {
        final categoryName = category.keys.first as String;
        final subCategories = (category[categoryName] as Map).map(
          (key, value) =>
              MapEntry(key as String, value as Map<String, dynamic>),
        );

        return {
          categoryName: subCategories,
        };
      }).toList();
    });
  }

  Future<void> toggleAlternativeFavorite(
      String subCategoryName, String alternativeName) async {
    final updatedAlternatives = localAlternatives.map((category) {
      final categoryName = category.keys.first as String;
      final subCategories = (category[categoryName] as Map).map(
        (key, value) => MapEntry(key as String, value as Map<String, dynamic>),
      );

      final updatedSubCategories = subCategories.map((key, subCategory) {
        if (key == subCategoryName) {
          final updatedItems = (subCategory['items'] as List).map((item) {
            final itemMap = item as Map<String, dynamic>;
            if (itemMap['name'] == alternativeName) {
              return {
                ...itemMap,
                'isFavorite': !(itemMap['isFavorite'] ?? false),
              };
            }
            return itemMap;
          }).toList();

          return MapEntry(key, {
            ...subCategory,
            'items': updatedItems,
          });
        }
        return MapEntry(key, subCategory);
      });

      return {
        categoryName: updatedSubCategories,
      };
    }).toList();

    await DataStorage.saveAlternatives(updatedAlternatives);

    setState(() {
      localAlternatives = updatedAlternatives;
    });
  }

  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      150,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  Color getColorForCategory(String subCategoryName) {
    if (!categoryColors.containsKey(subCategoryName)) {
      categoryColors[subCategoryName] = getRandomColor();
    }
    return categoryColors[subCategoryName]!;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      body: body(theme: theme),
    );
  }

  Widget body({TextTheme? theme}) {
    final hasFavoriteProducts = localProductInformation.any((category) {
      final products = category.values.first as Map<String, dynamic>;
      return products.values.any((product) => product['isFavorite'] == true);
    });

    final hasFavoriteAlternatives = localAlternatives.any((category) {
      final subCategories = category.values.first as Map<String, dynamic>;
      return subCategories.values.any((subCategory) {
        final items = subCategory['items'] as List;
        return items.any((item) => item['isFavorite'] == true);
      });
    });

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favourites',
              style: theme?.titleMedium,
            ),
            const SizedBox(height: 25),
            if (!hasFavoriteProducts && !hasFavoriteAlternatives)
              Expanded(
                child: noFavorite(theme: theme),
              ),
            if (hasFavoriteProducts)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Product Information',
                      style: theme?.headlineMedium,
                    ),
                  ),
                  SizedBox(
                    height: 180.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: localProductInformation.length,
                      itemBuilder: (context, index) {
                        final category = localProductInformation[index];
                        final categoryName = category.keys.first;
                        final products =
                            category[categoryName] as Map<String, dynamic>;

                        final favoriteProducts = products.entries
                            .where((entry) => entry.value['isFavorite'] == true)
                            .toList();

                        if (favoriteProducts.isEmpty) {
                          return const SizedBox();
                        }

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: favoriteProducts.map((entry) {
                            final productName = entry.key;
                            final productDetails =
                                entry.value as Map<String, dynamic>;

                            return Container(
                              width: 150.w,
                              margin: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (_) {
                                              return ProductDetails(
                                                productName: productName,
                                                productDetails: productDetails,
                                              );
                                            }),
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.asset(
                                            productDetails['image'],
                                            height: 120.w,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: GestureDetector(
                                          onTap: () => _toggleFavorite(
                                              categoryName, productName),
                                          child: Container(
                                            width: 32.w,
                                            height: 32.w,
                                            margin: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: AppColors.gray3,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              AppImages.favoritesIcon,
                                              color:
                                                  productDetails['isFavorite']
                                                      ? AppColors.primary
                                                      : AppColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (_) {
                                            return ProductDetails(
                                              productName: productName,
                                              productDetails: productDetails,
                                            );
                                          }),
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            productName,
                                            style:
                                                theme?.headlineMedium?.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            productDetails[
                                                    'Carbon Footprint'] ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                            style: theme?.titleSmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            if (hasFavoriteAlternatives)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 25),
                    child: Text(
                      'Products Alternatives',
                      style: theme?.headlineMedium,
                    ),
                  ),
                  SizedBox(
                    height: 130.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: localAlternatives.length,
                      itemBuilder: (context, index) {
                        final category = localAlternatives[index];
                        final categoryName = category.keys.first;
                        final subCategories =
                            category[categoryName] as Map<String, dynamic>;

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: subCategories.entries.map((entry) {
                            final subCategoryName = entry.key;
                            final subCategoryDetails =
                                entry.value as Map<String, dynamic>;
                            final items = subCategoryDetails['items'] as List;

                            final favoriteItems = items
                                .where((item) => item['isFavorite'] == true)
                                .toList();

                            if (favoriteItems.isEmpty) return const SizedBox();

                            return Row(
                              children: favoriteItems.map((item) {
                                return Container(
                                  width: 150.w,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Container(
                                              height: 120.w,
                                              width: double.infinity,
                                              color: getColorForCategory(
                                                  subCategoryName),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      item['name'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: theme
                                                          ?.headlineMedium
                                                          ?.copyWith(
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      item['description'] ?? '',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      style: theme?.titleSmall,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: GestureDetector(
                                              onTap: () =>
                                                  toggleAlternativeFavorite(
                                                      subCategoryName,
                                                      item['name']),
                                              child: Container(
                                                width: 32.w,
                                                height: 32.w,
                                                margin: const EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                  color: AppColors.gray3,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  AppImages.favoritesIcon,
                                                  color:
                                                      item['isFavorite'] == true
                                                          ? AppColors.primary
                                                          : AppColors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget noFavorite({TextTheme? theme}) {
    return Column(
      children: [
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              AppImages.bookmark,
              width: 49.w,
              height: 49.w,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                'To easily find products, click on the checkbox in the product cards',
                style: theme?.titleMedium,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            AppImages.noFavorite,
            height: 286.w,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const Spacer()
      ],
    );
  }
}
