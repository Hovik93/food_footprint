import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/data/quizzes_data.dart';
import 'package:food_footprint/ui/widgets/quizzes_list.dart';

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key});

  @override
  State<QuizzesScreen> createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
  List<String> filterLevelsList = [
    'Beginner level',
    'Intermediate level',
    'Advanced level'
  ];
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quizzes',
              style: theme?.titleMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: QuizzesListView(
                quizzes: quizData['quizzes'], 
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget filterLevelsBlock({TextTheme? theme}) {
    return SizedBox(
      height: 28.w,
      child: ListView.builder(
        itemCount: filterLevelsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: AppColors.gray1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                filterLevelsList[index],
                style: theme?.titleSmall,
              ),
            ),
          );
        },
      ),
    );
  }
}
