import 'package:flutter/material.dart';
import 'package:gopher/screens/add_your_email_screen.dart';
import 'package:gopher/screens/change_password_screen.dart';
import 'package:gopher/screens/contact_us.dart';
import 'package:gopher/screens/create_new_account_screen.dart';
import 'package:gopher/screens/create_password_screen.dart';
import 'package:gopher/screens/edit_profile_screen.dart';
import 'package:gopher/screens/faqs_screen.dart';
import 'package:gopher/screens/home_screen.dart';
import 'package:gopher/screens/job_detail_screen.dart';
import 'package:gopher/screens/login_screen.dart';
import 'package:gopher/screens/privacy_policy_screen.dart';
import 'package:gopher/screens/register_your_details_screen.dart'
    show RegisterYourDetailsScreen;
import 'package:gopher/screens/splash_screen.dart';
import 'package:gopher/screens/lanuch_screen.dart';
import 'package:gopher/screens/successfully_created_screen.dart';
import 'package:gopher/screens/terms_and_condition_screen.dart';
import 'package:gopher/screens/verify_your_email_screen.dart';

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
const String addYourEmailScreen = '/add_your_email_screen';
const String verifyYourEmailScreen = '/verify_your_email_screen';
const String createPasswordScreen = '/create_password_screen';
const String registerYourDetailsScreen = '/register_your_details_screen';
const String successfullyCreatedScreen = '/successfully_created_screen';
const String jobsDetailScreen = '/jobs_detail_screen';
const String editProfileScreen = '/edit_profile_screen';
const String changePasswordScreen = '/change_password_screen';
const String contactUsScreen = '/contact_us_screen';
const String faqsScreen = '/faqs_screen';
const String termsAndConditionsScreen = '/terms_and_conditions_screen';
const String privacyPolicyScreen = '/privacy_policy_screen';

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
      case addYourEmailScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: addYourEmailScreen),
          builder: (_) => const AddEmailYourScreen(),
        );
      case verifyYourEmailScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: verifyYourEmailScreen),
          builder: (_) => const VerifyYourEmailScreen(),
        );
      case createPasswordScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: createPasswordScreen),
          builder: (_) => const CreatePasswordScreen(),
        );

      case registerYourDetailsScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: registerYourDetailsScreen),
          builder: (_) => const RegisterYourDetailsScreen(),
        );
      case successfullyCreatedScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: successfullyCreatedScreen),
          builder: (_) => const SuccessfullyCreatedScreen(),
        );
      case jobsDetailScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: jobsDetailScreen),
          builder: (_) => const JobDetailScreen(),
        );
        case editProfileScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: editProfileScreen),
          builder: (_) => const EditProfileScreen(),
        );
        case changePasswordScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: changePasswordScreen),
          builder: (_) => const ChangePasswordScreen(),
        );
        case contactUsScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: contactUsScreen),
          builder: (_) => const ContactUs(),
        );
        case faqsScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: faqsScreen),
          builder: (_) => const FaqsScreen(),
        );
        case termsAndConditionsScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: termsAndConditionsScreen),
          builder: (_) => const TermsAndConditionsScreen(),
        );
        case privacyPolicyScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: privacyPolicyScreen),
          builder: (_) => const PrivacyPolicyScreen(),
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
