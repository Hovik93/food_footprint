import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/base/quizzes_data.dart';
import 'package:food_footprint/ui/widgets/quizzes_list.dart';

class HomeScreen extends StatefulWidget {
  final Function(int, int)
      onNavigateTo; // Функция, принимающая два параметра (индекс экрана, индекс вкладки)

  const HomeScreen({
    super.key,
    required this.onNavigateTo,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    productInformation(theme: theme),
                    SizedBox(
                      height: 20.w,
                    ),
                    productsAlternatives(theme: theme),
                    SizedBox(
                      height: 20.w,
                    ),
                    quizzes(theme: theme),
                    SizedBox(
                      height: 20.w,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
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

  Widget productInformation({TextTheme? theme}) {
    return Container(
      padding: const EdgeInsets.all(15),
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
          )
        ],
      ),
    );
  }

  Widget productsAlternatives({TextTheme? theme}) {
    return Container(
      padding: const EdgeInsets.all(15),
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
          )
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
            height: 108.w,
            margin: EdgeInsets.only(top: 15),
            child: QuizzesListView(
              quizzes: quizData['quizzes'], // Передаем список викторин
              scrollDirection: Axis.horizontal, // Горизонтальная прокрутка
            ),
          )
        ],
      ),
    );
  }
}
