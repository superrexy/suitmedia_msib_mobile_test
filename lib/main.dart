import 'package:flutter/material.dart';
import 'package:suitmedia_msib_test/src/screens/first_screen.dart';
import 'package:suitmedia_msib_test/src/screens/second_screen.dart';
import 'package:suitmedia_msib_test/src/screens/third_screen.dart';

import 'src/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suitmedia MSIB 5 Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        FirstScreen.routeName: (context) => const FirstScreen(),
        SecondScreen.routeName: (context) => const SecondScreen(),
        ThirdScreen.routeName: (context) => const ThirdScreen(),
      },
    );
  }
}
