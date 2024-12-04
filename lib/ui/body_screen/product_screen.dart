import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/base/images.dart';
import 'package:food_footprint/base/product_information_data.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.initialIndex);
    _initializeData();
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
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 10, top: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.gray1),
                      child: Center(
                        child: Text(
                          localProductInformation[index].keys.first,
                          style: theme?.titleSmall,
                        ),
                      ),
                    ),
                  );
                },
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
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  productInformationBody(theme: theme),
                  const Center(
                    child: Text(
                      "Content for Alternatives",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
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

    List<Widget> categoryWidgets = [];

    for (var categoryData in localProductInformation) {
      categoryWidgets.addAll(categoryData.entries.map((category) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                category.key,
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
              itemCount: category.value.length,
              itemBuilder: (context, index) {
                final productName = category.value.keys.elementAt(index);
                final productDetails = category.value[productName];
                final images = productDetails['image'];
                final isFavorite = productDetails['isFavorite'] ?? false;

                return GestureDetector(
                  onTap: () => _toggleFavorite(category.key, productName),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              images,
                              fit: BoxFit.cover,
                              height: 160.w,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () =>
                                  _toggleFavorite(category.key, productName),
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
                );
              },
            ),
          ],
        );
      }).toList());
    }

    return ListView(
      children: categoryWidgets,
    );
  }
}
