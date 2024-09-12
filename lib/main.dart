import 'package:flutter/material.dart';
import 'package:saloon/screens/login.dart';
import 'package:saloon/screens/splash_screen.dart';
import 'animations/fade_page_route.dart';
import 'color/colors.dart';  // Adjust the import based on your project structure

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Billing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Define your primary and accent colors here
        primaryColor: AppColors.primary,
        hintColor: AppColors.accent,
      ),
      home: SplashScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/login') {
          return FadePageRoute(page: LoginSignupScreen());
        }
        return null;
      },
    );
  }
}
