import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const SnapShareAIApp());
}

class SnapShareAIApp extends StatelessWidget {
  const SnapShareAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SnapShare AI',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}