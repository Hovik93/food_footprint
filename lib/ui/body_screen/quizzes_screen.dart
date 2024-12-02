import 'package:flutter/material.dart';

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key});

  @override
  State<QuizzesScreen> createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
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
          children: [
            Text(
              'Quizzes',
              style: theme?.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}