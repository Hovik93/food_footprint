import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/base/images.dart';
import 'package:food_footprint/data/alternatives_data.dart';
import 'package:food_footprint/data/product_information_data.dart';
import 'package:food_footprint/ui/body_screen/details_screen/product_details.dart';
import 'package:food_footprint/ui/data_storage.dart';

class ProductScreen extends StatefulWidget {
  final int initialIndex;
  const ProductScreen({super.key, required this.initialIndex});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> localProductInformation = [];
  List<Map<String, dynamic>> localAlternatives = [];
  final Map<String, Color> categoryColors = {};
  List<String> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.initialIndex);
    _initializeData();
    _initializeAlternatives();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              'Products',
              style: theme?.titleMedium,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 28.w,
              child: ListView.builder(
                itemCount: localProductInformation.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  String categoryName =
                      localProductInformation[index].keys.first;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedCategories.contains(categoryName)) {
                          selectedCategories.remove(categoryName);
                        } else {
                          selectedCategories.add(categoryName);
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selectedCategories.contains(categoryName)
                            ? AppColors.green
                            : AppColors.gray1,
                      ),
                      child: Center(
                        child: Text(
                          categoryName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme?.titleSmall?.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Divider(
                      color: Colors.grey.shade700,
                      thickness: 1.0,
                      height: 0,
                    ),
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  indicatorColor: AppColors.green,
                  labelColor: AppColors.white,
                  unselectedLabelColor: Colors.grey,
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerHeight: 0,
                  tabs: const [
                    Tab(text: "Product Information"),
                    Tab(text: "Alternatives"),
                  ],
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  productInformationBody(theme: theme),
                  alternativesBody(theme: theme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productInformationBody({TextTheme? theme}) {
    if (localProductInformation.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final filteredData = selectedCategories.isEmpty
        ? localProductInformation
        : localProductInformation
            .where((categoryData) =>
                selectedCategories.contains(categoryData.keys.first))
            .toList();

    return ListView(
      children: filteredData.map((categoryData) {
        final categoryName = categoryData.keys.first;
        final products = categoryData[categoryName];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                categoryName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 0.8,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final productName = products.keys.elementAt(index);
                final productDetails = products[productName];
                final images = productDetails['image'];
                final isFavorite = productDetails['isFavorite'] ?? false;

                return Column(
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
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              images,
                              fit: BoxFit.cover,
                              height: 158.w,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: GestureDetector(
                            onTap: () =>
                                _toggleFavorite(categoryName, productName),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6),
                          Text(
                            productName,
                            overflow: TextOverflow.ellipsis,
                            style: theme?.headlineMedium?.copyWith(
                              fontSize: 14,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            productDetails["Carbon Footprint"] ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: theme?.headlineMedium?.copyWith(
                              fontSize: 12,
                              color: AppColors.grayLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget alternativesBody({TextTheme? theme}) {
    final filteredAlternatives = selectedCategories.isEmpty
        ? localAlternatives
        : localAlternatives.where((category) {
            final categoryName = category.keys.first;
            return selectedCategories.contains(categoryName);
          }).toList();
    return filteredAlternatives.isEmpty
        ? Center(
            child: Text(
              "No Alternatives Found",
              style:
                  theme?.headlineMedium?.copyWith(color: AppColors.grayLight),
            ),
          )
        : ListView.builder(
            itemCount: filteredAlternatives.length,
            itemBuilder: (context, categoryIndex) {
              final category = filteredAlternatives[categoryIndex];
              final categoryName = category.keys.first;
              final subCategories = category[categoryName];

              return _buildCategory(
                categoryName,
                subCategories,
                theme,
              );
            },
          );
  }

  Widget _buildCategory(String categoryName, Map<String, dynamic> subCategories,
      TextTheme? theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryName,
            style: theme?.headlineMedium,
          ),
          const SizedBox(height: 12),
          ...subCategories.entries.map((subCategoryEntry) {
            final subCategoryName = subCategoryEntry.key;
            final subCategoryDetails = subCategoryEntry.value;
            final items = subCategoryDetails['items'];
            final subCategoryColor = getColorForCategory(subCategoryName);

            return _buildSubCategory(
              subCategoryName,
              subCategoryDetails,
              items,
              subCategoryColor,
              theme,
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildSubCategory(
    String subCategoryName,
    Map<String, dynamic> subCategoryDetails,
    List<dynamic> items,
    Color subCategoryColor,
    TextTheme? theme,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(subCategoryDetails['image']),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subCategoryName,
                  style: theme?.headlineMedium?.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 10),
                _buildGridItems(
                    items: items,
                    crossAxisCount: 2,
                    itemCount: items.length > 2 ? 2 : items.length,
                    subCategoryColor: subCategoryColor,
                    theme: theme,
                    subCategoryName: subCategoryName),
                if (items.length > 2)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _buildGridItems(
                        items: items,
                        crossAxisCount: 1,
                        itemCount: items.length - 2,
                        subCategoryColor: subCategoryColor,
                        theme: theme,
                        startIndex: 2,
                        subCategoryName: subCategoryName),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItems({
    required List<dynamic> items,
    required int crossAxisCount,
    required int itemCount,
    required Color subCategoryColor,
    required TextTheme? theme,
    required String subCategoryName,
    int startIndex = 0,
  }) {
    return MasonryGridView.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 12,
      crossAxisSpacing: 8,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final item = items[startIndex + index];
        final isFavorite = item['isFavorite'] ?? false;

        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                child: Container(
                  height: 119,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: subCategoryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['name'],
                            style:
                                theme?.headlineMedium?.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item['description'],
                        style: theme?.titleSmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  toggleAlternativeFavorite(
                    subCategoryName,
                    item['name'],
                  );
                },
                child: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: AppColors.gray3,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AppImages.favoritesIcon,
                    color: isFavorite ? AppColors.primary : AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
