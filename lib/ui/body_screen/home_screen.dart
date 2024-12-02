import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
          children: [
            Text(
              'Home',
              style: theme?.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
