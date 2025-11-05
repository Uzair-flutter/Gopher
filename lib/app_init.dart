// app_init.dart
//

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gopher/route_generator.dart';
import 'package:gopher/utills/theme.dart';
import 'package:gopher/view_models/theme_view_model.dart';
import 'package:provider/provider.dart';

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final ThemeMode themeMode = context.watch<ThemeViewModel>().themeMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gopher',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: SplashScreen(),
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
