import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/base/images.dart';
import 'package:food_footprint/data/alternatives_data.dart';
import 'package:food_footprint/data/product_information_data.dart';
import 'package:food_footprint/data/quizzes_data.dart';
import 'package:food_footprint/ui/body_screen/details_screen/product_details.dart';
import 'package:food_footprint/ui/data_storage.dart';
import 'package:food_footprint/ui/widgets/quizzes_list.dart';

class HomeScreen extends StatefulWidget {
  final Function(int, int) onNavigateTo;

  const HomeScreen({
    super.key,
    required this.onNavigateTo,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home',
              style: theme?.titleMedium,
            ),
            SizedBox(
              height: 10.w,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    welcomeToFoodFootprint(theme: theme),
                    SizedBox(
                      height: 20.w,
                    ),
                    productInformationBlock(theme: theme),
                    SizedBox(
                      height: 20.w,
                    ),
                    productsAlternativesBlock(theme: theme),
                    SizedBox(
                      height: 20.w,
                    ),
                    quizzes(theme: theme),
                    SizedBox(
                      height: 20.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/tip_of_the_day');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 30.w,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                            child: Text(
                          'Tip of the day',
                          style: theme?.headlineMedium?.copyWith(fontSize: 14),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // "Tip of the day" button Fixed bottom screen
          ],
        ),
      ),
    );
  }

  Widget welcomeToFoodFootprint({TextTheme? theme}) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Food Footprint',
            style: theme?.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'This app is your guide to making informed food choices that are good for the planet. Explore our database of foods, learn about their environmental impact, and discover eco-friendly alternatives.',
              style: theme?.titleSmall,
            ),
          ),
          Text(
            "With quizzes and articles, you'll gain the knowledge to reduce your carbon footprint and create a more sustainable future.",
            style: theme?.titleSmall,
          )
        ],
      ),
    );
  }

  Widget productInformationBlock({TextTheme? theme}) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Information',
                style: theme?.headlineMedium,
              ),
              GestureDetector(
                onTap: () {
                  widget.onNavigateTo(1, 0);
                },
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: localProductInformation.length,
              itemBuilder: (context, index) {
                final category = localProductInformation[index];
                final categoryName = category.keys.first;
                final products = category[categoryName] as Map<String, dynamic>;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: products.entries.map((entry) {
                    final productName = entry.key;
                    final productDetails = entry.value as Map<String, dynamic>;

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
                                  borderRadius: BorderRadius.circular(12),
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
                                      color: productDetails['isFavorite']
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productName,
                                    style: theme?.headlineMedium?.copyWith(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    productDetails['Carbon Footprint'] ?? '',
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
    );
  }

  Widget productsAlternativesBlock({TextTheme? theme}) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Products Alternatives',
                style: theme?.headlineMedium,
              ),
              GestureDetector(
                onTap: () {
                  widget.onNavigateTo(1, 1);
                },
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
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

                    return Row(
                      children: items.take(1).map((item) {
                        final isFavorite = item['isFavorite'] ?? false;
                        return Container(
                          width: 150.w,
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      height: 119.w,
                                      width: double.infinity,
                                      color:
                                          getColorForCategory(subCategoryName),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item['name'],
                                              overflow: TextOverflow.ellipsis,
                                              style: theme?.headlineMedium
                                                  ?.copyWith(
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              item['description'] ?? '',
                                              overflow: TextOverflow.ellipsis,
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
                                      onTap: () => toggleAlternativeFavorite(
                                          subCategoryName, item['name']),
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
                                          color: isFavorite
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
    );
  }

  Widget quizzes({TextTheme? theme}) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quizzes',
                style: theme?.headlineMedium,
              ),
              GestureDetector(
                onTap: () {
                  widget.onNavigateTo(3, 0);
                },
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: AppColors.white,
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 122.w,
            margin: EdgeInsets.only(top: 15),
            child: QuizzesListView(
              quizzes: quizData['quizzes'],
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
