import 'package:flutter/material.dart';

import 'screens/bottom_nav_page.dart';
import 'screens/create_new_account_screen.dart';
import 'screens/home_screen.dart';
import 'screens/lanuch_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';

const String splashScreen = '/';
const String bottomNavPage = '/bottom_nav_page';
const String homeScreen = '/home_screen';
const String loginScreen = '/login_screen';
const String launchScreen = '/launch_screen';
const String createNewAccountScreen = '/create_new_account_screen';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: splashScreen),
          builder: (_) => SplashScreen(),
        );
      case bottomNavPage:
        return MaterialPageRoute(
          settings: RouteSettings(name: bottomNavPage),
          builder: (_) => BottomNavPage(),
        );
      case homeScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: homeScreen),
          builder: (_) => HomeScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: loginScreen),
          builder: (_) => LoginScreen(),
        );
      case launchScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: launchScreen),
          builder: (_) => const LaunchScreen(),
        );
      case createNewAccountScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: createNewAccountScreen),
          builder: (_) => const CreateNewAccountScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(child: Text('ERROR')),
        );
      },
    );
  }
}
