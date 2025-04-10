import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';

void main() {
  runApp(const TiktokApp());
}

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TiktokApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE9435A)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: SignUpScreen(),
    );
  }
}
