import 'package:flutter/material.dart';
import 'package:gopher/screens/create_new_account_screen.dart';
import 'package:gopher/screens/home_screen.dart';
import 'package:gopher/screens/login_screen.dart';
import 'package:gopher/screens/splash_screen.dart';
import 'package:gopher/screens/lanuch_screen.dart';

const String splashScreen = '/';
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
