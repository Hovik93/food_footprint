// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/base/images.dart';
import 'package:food_footprint/ui/body_screen/articles_and_tips.dart';
import 'package:food_footprint/ui/body_screen/favorites_screen.dart';
import 'package:food_footprint/ui/body_screen/home_screen.dart';
import 'package:food_footprint/ui/body_screen/product_screen.dart';
import 'package:food_footprint/ui/body_screen/quizzes_screen.dart';
import 'package:food_footprint/ui/body_screen/settings.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int? selectedIndex;
  int? tabIndex;
  HomePage({
    super.key,
    this.selectedIndex,
    this.tabIndex,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _selectedIndex = 0;
  int? _tabIndex = 0;

  void onTap(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.selectedIndex != null) {
      _selectedIndex = widget.selectedIndex;
      _tabIndex = widget.tabIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: BottomNavigationBar(
            backgroundColor: AppColors.backgroundColor,
            currentIndex: _selectedIndex ?? 0,
            elevation: 0,
            selectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.orange,
            selectedIconTheme: IconThemeData(color: AppColors.orange),
            onTap: onTap,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.home,
                    width: 22.w,
                    height: 22.w,
                    color: _selectedIndex == 0
                        ? AppColors.primary
                        : AppColors.gray,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.product,
                    width: 22.w,
                    height: 22.w,
                    color: _selectedIndex == 1
                        ? AppColors.primary
                        : AppColors.gray,
                  ),
                  label: 'Product'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.favorites,
                    width: 22.w,
                    height: 22.w,
                    color: _selectedIndex == 2
                        ? AppColors.primary
                        : AppColors.gray,
                  ),
                  label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.quizzes,
                    width: 22.w,
                    height: 22.w,
                    color: _selectedIndex == 3
                        ? AppColors.primary
                        : AppColors.gray,
                  ),
                  label: 'Quizzes'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.articlesAndTips,
                    width: 22.w,
                    height: 22.w,
                    color: _selectedIndex == 4
                        ? AppColors.primary
                        : AppColors.gray,
                  ),
                  label: 'Articles And Tips'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.settings,
                    width: 22.w,
                    height: 22.w,
                    color: _selectedIndex == 5
                        ? AppColors.primary
                        : AppColors.gray,
                  ),
                  label: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }

  void onTapHome(int index, int tabIndex) {
    setState(() {
      _selectedIndex = index;
      _tabIndex = tabIndex;
    });
  }

  Widget body() {
    final list = [
      HomeScreen(onNavigateTo: onTapHome),
      ProductScreen(initialIndex: _tabIndex ?? 0),
      const FavoritesScreen(),
      const QuizzesScreen(),
      const ArticlesAndTipsScreen(),
      const SettingsScreen(),
    ];
    return list[_selectedIndex ?? 0];
  }
}
