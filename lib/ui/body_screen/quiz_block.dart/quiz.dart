// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_footprint/base/colors.dart';
import 'package:food_footprint/base/images.dart';

// ignore: must_be_immutable
class QuizPage extends StatefulWidget {
  String? title;
  List<Map<String, dynamic>>? questions;
  QuizPage({
    super.key,
    this.title,
    this.questions,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0; // Текущий вопрос
  int selectedIndex = -1; // Индекс выбранного ответа
  bool showCorrectAnswer = false; // Флаг для отображения правильного ответа
  int correctAnswersCount = 0;
  bool finishQuiz = false;

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
          children: [
            appBar(theme: theme),
            contentBlock(theme: theme),
          ],
        ),
      ),
    );
  }

  Widget appBar({TextTheme? theme}) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 36.w,
            height: 36.w,
            decoration:
                BoxDecoration(color: AppColors.gray3, shape: BoxShape.circle),
            child: Icon(
              Icons.close_outlined,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          widget.title ?? '',
          style: theme?.titleMedium,
        )
      ],
    );
  }

  Widget contentBlock({TextTheme? theme}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.gray1,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.questions != null && widget.questions!.isNotEmpty)
              questionsBlock(theme: theme, index: questionNumber),
            const Spacer(),
            bottomButton(theme: theme),
          ],
        ),
      ),
    );
  }

  Widget bottomButton({TextTheme? theme}) {
    return GestureDetector(
      onTap: () {
        if (selectedIndex == -1)
          return; // Нельзя двигаться дальше без выбора ответа

        if (widget.questions?[questionNumber]['options'][selectedIndex] ==
            widget.questions?[questionNumber]['correctAnswer']) {
          correctAnswersCount++; // Увеличиваем счетчик правильных ответов
        }

        setState(() {
          showCorrectAnswer = true; // Отображаем правильный ответ
        });

        // Задержка перед переходом к следующему вопросу
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            if (questionNumber < (widget.questions?.length ?? 0) - 1) {
              setState(() {
                questionNumber++; // Переход к следующему вопросу
                selectedIndex = -1; // Сброс выбора
                showCorrectAnswer = false; // Скрываем правильный ответ
              });
            } else {
              finishQuiz = true;
              setState(() {});
              // Завершение квиза
            }
          }
        });
      },
      child: Container(
        width: double.infinity,
        height: 40.w,
        margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedIndex == -1
              ? AppColors.gray3
              : AppColors.primary, // Блокируем кнопку, если нет выбора
        ),
        child: Center(
          child: Text(
            !finishQuiz ? 'Next' : 'Back to quests',
            style: theme?.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget questionsBlock({TextTheme? theme, required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
      child: !finishQuiz
          ? Column(
              children: [
                Text(
                  widget.questions?[index]['question'] ?? '',
                  style: theme?.headlineMedium,
                ),
                SizedBox(
                  height: 30.w,
                ),
                ...List.generate(
                  widget.questions?[index]['options']?.length ?? 0,
                  (ind) {
                    String optionText =
                        widget.questions?[index]['options'][ind] ?? '';
                    String correctText =
                        widget.questions?[index]['correctAnswer'] ?? '';
                    Color backgroundColor = AppColors.gray1;
                    Color borderColor = Colors.transparent;

                    if (showCorrectAnswer) {
                      // Если правильный ответ показывается
                      if (optionText == correctText) {
                        borderColor =
                            AppColors.green; // Зеленая рамка правильного ответа
                      }
                      if (ind == selectedIndex) {
                        backgroundColor = optionText == correctText
                            ? AppColors.green // Зеленый для правильного ответа
                            : Colors.red; // Красный для неправильного ответа
                      }
                    } else if (ind == selectedIndex) {
                      backgroundColor =
                          AppColors.gray3; // Подсветка выбора до нажатия Next
                    }

                    return GestureDetector(
                      onTap: showCorrectAnswer
                          ? null // Блокируем выбор, если показывается правильный ответ
                          : () {
                              setState(() {
                                selectedIndex = ind;
                              });
                            },
                      child: Container(
                        width: double.infinity,
                        height: 54.w,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        margin: EdgeInsets.only(bottom: 10.w),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderColor, width: 2),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          optionText,
                          style: theme?.titleMedium,
                        ),
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.w),
                    child: Text(
                      'Question ${index + 1} of ${widget.questions?.length}',
                      style: theme?.titleSmall
                          ?.copyWith(color: AppColors.grayLight),
                    ),
                  ),
                )
              ],
            )
          : finishQuizContent(theme: theme),
    );
  }

  Widget finishQuizContent({TextTheme? theme}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quiz result',
          style: theme?.titleSmall?.copyWith(color: AppColors.grayLight),
        ),
        Text(
          'Correct answers $correctAnswersCount out of ${widget.questions?.length}',
          style: theme?.headlineMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.questFin,
              width: 72.w,
              height: 72.w,
            ),
          ),
        )
      ],
    );
  }
}
