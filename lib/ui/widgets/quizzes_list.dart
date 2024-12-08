import 'package:flutter/material.dart';
import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/ui/body_screen/quiz_block.dart/quiz.dart';

class QuizzesListView extends StatelessWidget {
  final List<Map<String, dynamic>> quizzes;
  final Axis scrollDirection;

  const QuizzesListView({
    super.key,
    required this.quizzes,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;

    return ListView.builder(
      itemCount: quizzes.length,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          margin: EdgeInsets.only(
            bottom: scrollDirection == Axis.vertical ? 12 : 0,
            right: scrollDirection == Axis.horizontal ? 12 : 0,
          ),
          width: scrollDirection == Axis.horizontal
              ? MediaQuery.of(context).size.width * 0.78
              : null,
          decoration: BoxDecoration(
            color: AppColors.gray1,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  quizzes[index]['quizTitle'],
                  style: theme.titleSmall,
                ),
              ),
              SizedBox(height: scrollDirection == Axis.horizontal ? 30 : 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return QuizPage(
                        title: quizzes[index]['quizTitle'],
                        questions: quizzes[index]['questions'],
                      );
                    }),
                  );
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Start',
                          style:
                              theme.titleSmall?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_outward_sharp,
                            color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
