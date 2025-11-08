import 'package:flutter/material.dart';
import 'package:gopher/screens/add_your_email_screen.dart';
import 'package:gopher/screens/all_gopher_screen.dart';
import 'package:gopher/screens/all_reviews_screen.dart';
import 'package:gopher/screens/change_password_screen.dart';
import 'package:gopher/screens/create_new_account_screen.dart';
import 'package:gopher/screens/create_password_screen.dart';
import 'package:gopher/screens/home_screen.dart';
import 'package:gopher/screens/job_detail_screen.dart';
import 'package:gopher/screens/lanuch_screen.dart';
import 'package:gopher/screens/login_screen.dart';
import 'package:gopher/screens/register_your_details_screen.dart'
    show RegisterYourDetailsScreen;
import 'package:gopher/screens/rider_form_screen.dart';
import 'package:gopher/screens/select_gopher_screen.dart';
import 'package:gopher/screens/select_service_screen.dart';
import 'package:gopher/screens/service_booking_screen.dart';
import 'package:gopher/screens/splash_screen.dart';
import 'package:gopher/screens/successfully_created_screen.dart';
import 'package:gopher/screens/verify_your_email_screen.dart';
import 'screens/bottom_nav_page.dart';

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
const String allGopherScreen = '/all_gopher_screen';
const String contactUsScreen = '/contact_us_screen';
const String faqsScreen = '/faqs_screen';
const String termsAndConditionsScreen = '/terms_and_conditions_screen';
const String privacyPolicyScreen = '/privacy_policy_screen';
const String selectServiceScreen = '/select_service_screen';
const String selectGopherScreen = '/select_gopher_screen';
const String riderFormScreen = '/rider_form_screen';
const String allReviewsScreen = '/all_reviews_screen';
const String serviceBookingScreen = '/service_booking_screen';

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
      case selectServiceScreen:
        return MaterialPageRoute(
          builder: (_) => SelectServiceScreen(),
          settings: RouteSettings(name: selectServiceScreen),
        );
        case editProfileScreen:
        return MaterialPageRoute(
          builder: (_) => SelectGopherScreen(),
          settings: RouteSettings(name: selectGopherScreen),
        );
        case changePasswordScreen:
        return MaterialPageRoute(
          builder: (_) => RiderFormScreen(),
          settings: RouteSettings(name: riderFormScreen),
        );
      case allGopherScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: allGopherScreen),
          builder: (_) => const AllGopherScreen(),
        );
      case allReviewsScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: allReviewsScreen),
          builder: (_) => const AllReviewsScreen(),
        );
      case serviceBookingScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: serviceBookingScreen),
          builder: (_) => const ServiceBookingScreen(),
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
